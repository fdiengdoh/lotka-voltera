# Lotka-Voltera
Solution to Lota-Voltera prey-predator model using Fortran

Lotka Voltera prey-predator model, for an autocatalytic reaction. 

**For the reaction**

$$A \rightarrow 2X$$

$$X + Y \rightarrow 2Y$$

$$Y \rightarrow B$$

Rate change for X and Y can be defined as:

$${{dX} \over {dt}} = \alpha[A][X] - \beta [X][Y]$$

$${{dY} \over {dt}} = \gamma[X][Y] - \delta [Y]$$

Using the 4th Order Runge-Kutta Method to solve the above system of differential equations:

$$k_1 = hf(t_n,x_n,y_n)$$

$$l_1 = hg(t_n,x_n,y_n)$$

$$k_2 = hf(t_n + {h \over 2}, x_n + {k_1 \over 2}, y_n + {l_1\over2} ) $$

$$l_2 = hf(t_n + {h \over 2}, x_n + {k_1 \over 2}, y_n + {l_1\over2} ) $$

$$k_3 = hf(t_n + {h \over 2}, x_n + {k_2 \over 2}, y_n + {l_2\over2} ) $$

$$l_3 = hf(t_n + {h \over 2}, x_n + {k_2 \over 2}, y_n + {l_2\over2} ) $$

$$k_4 = hf(t_n + h, x_n + k_3, y_n + l_3 ) $$

$$l_4 = hf(t_n + h, x_n + k_3, y_n + l_3 ) $$

$$t_{n+1} = t_n + h$$

$$x_{n+1} = x_n + {1\over6}(k_1 + 2k_2 + 2k_3 + k_4)$$

$$y_{n+1} = y_n + {1\over6}(l_1 + 2l_2 + 2l_3 + l_4)$$

Using the above algorithm, a Fortran program is [created](/src/) and values of $x_i$, $y_i$ are obtained from $x_0 - x_n$ and $y_0 - y_n$ at interval of time $t = h = 0.01$ for 2000 times. Taking the example values as follows:

$\alpha = 2.0$

$\beta = \gamma = 0.02$

$\delta = 1.0$

Initial values as:

$t_0 = 0.0$

$x_0 = 100.0$

$y_0 = 15.0$

# Plotting the Result
[gnuplot](http://www.gnuplot.info/) is used for plotting the result obtained from the simulation. After the result is obtained, gnuplot is set to output in svg and also in png. The svg files are given below, while you can also look for png files in [images](/images) directory. 

Settings for gnuplot to output svg files are as follows:

```
#!/usr/local/bin/gnuplot -persist

set terminal svg enhanced font 'Arial,11'
set output "rk.svg"
set title "[X]/[Y] vs Time Plot"
set xlabel "Time (t)"
set ylabel "[X]/[Y]"
set yrange [0:450]
plot "lv-res.dat" u (column(0)):2 w l lw 3 lc rgb '#9400d4' title "[X]","lv-res.dat" u (column(0)):3 w l lw 3 lc rgb '#0060ad' title "[Y]"

set terminal svg enhanced font 'Arial,11'
set title "[X] vs [Y] Plot"
set xlabel "[X]"
set ylabel "[Y]"
set output "rk2.svg"
plot "lv-res.dat" using 2:3 w l lw 3 lc rgb '#0060ad' title ""
```

**[X],[Y] vs Time (t) plot**

![X,Y Vs Time Plot](/images/rk.svg)

**[X] vs [Y] Plot**

![X Vs Y Plot](/images/rk2.svg)

# Notes
- The subroutine [rk4.f](/src/rk4.f) was adapted from [Numerical Recipes in Fortran 77, Second Edition (1992)](http://phys.uri.edu/nigh/NumRec/bookfpdf/f16-1.pdf)
