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
