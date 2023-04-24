c     Main Routine of the Lotka-Voltera Prey-Predator
      IMPLICIT REAL*8(a-h,o-z)
      COMMON alpha,beta,delta
      EXTERNAL derivs
      PARAMETER(n=2,nm=2000)
      DIMENSION dydx(n),y(n),yout(n)

      alpha = 2.0
      beta = 0.02
      delta = 1.0
      x = 0.0
      h = 0.01
      y(1)=100.0
      y(2)=15.0
      
      call derivs(x,y,dydx)
      
      do i=1,nm
        write(*,*)x,y(1),y(2)
        x = x+h 
        call derivs(x,y,dydx)
        call rk4(y,dydx,n,x,h,yout,derivs)
        y(1)=yout(1)
        y(2)=yout(2)
      enddo      
      STOP
      END

c     Sub-Routine for ODE      
      SUBROUTINE derivs(x,y,dydx)
      IMPLICIT REAL*8(a-h,o-z)
      DIMENSION dydx(*),y(*)
      COMMON alpha,beta,delta 
        dydx(1)=alpha*y(1)-beta*y(1)*y(2)
        dydx(2)=gamma*y(1)*y(2)-delta*y(2)
      return
      END

c     Sub-Routine for 4th order Runge-Kutta Method
      SUBROUTINE rk4(y,dydx,n,x,h,yout,derivs) 
      IMPLICIT REAL*8(a-h,o-z)
      PARAMETER (NMAX=50)
      DIMENSION dydx(n),y(n),yout(n),dym(NMAX),dyt(NMAX),yt(NMAX)
      EXTERNAL derivs
      
      hh=h*0.5
      h6=h/6.
      xh=x+hh

      do i=1,n 
        yt(i)=y(i)+hh*dydx(i)
      enddo

      call derivs(xh,yt,dyt)

      do i=1,n
        yt(i)=y(i)+hh*dyt(i) 
      enddo
      
      call derivs(xh,yt,dym)

      do i=1,n
        yt(i)=y(i)+h*dym(i)
        dym(i)=dyt(i)+dym(i) 
      enddo
      
      call derivs(x+h,yt,dyt)

      do i=1,n
        yout(i)=y(i)+h6*(dydx(i)+dyt(i)+2.*dym(i))
      enddo
      return
      END