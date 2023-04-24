# Lotka-Voltera
Solution to Lota-Voltera prey-predator model using Fortran

Lotka Voltera prey-predator model, for an autocatalytic reaction. 

**For the reaction**

$$A \rightarrow 2X$$

$$X + Y \rightarrow 2Y$$

$$Y \rightarrow B$$

Rate change for X and Y can be defined as:

$${{dX} \over {dt}} = \alpha[A][X] - \betta [X][Y]$$
$${{dY} \over {dt}} = \gamma[X][Y] - \delta [Y]$$
