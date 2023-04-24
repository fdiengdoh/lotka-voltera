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

$$t_{n+1} = t_n + h

$$x_{n+1} = x_n + {1\over6}(k_1 + 2k_2 + 2k_3 + k_4)$$

$$y_{n+1} = y_n + {1\over6}(l_1 + 2l_2 + 2l_3 + l_4)$$

