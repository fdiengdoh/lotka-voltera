c     Sub-Routine for ODE      
      SUBROUTINE derivs(x,y,dydx)
      IMPLICIT REAL*8(a-h,o-z)
      DIMENSION dydx(*),y(*)
      COMMON alpha,beta,gamma,delta 
        dydx(1)=alpha*y(1)-beta*y(1)*y(2)
        dydx(2)=gamma*y(1)*y(2)-delta*y(2)
      return
      END
