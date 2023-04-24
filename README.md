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

$$k_2 = hf(t_n +h\over2, x_n + k_1/2, y_n + l1/2$
$l_2 = hf(t_n +h/2, x_n + k_2/2, y_n + l2/2$
