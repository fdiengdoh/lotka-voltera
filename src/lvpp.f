c     Main Routine of the Lotka-Voltera Prey-Predator
      IMPLICIT REAL*8(a-h,o-z)
      COMMON alpha,beta,gamma,delta
      EXTERNAL derivs
      PARAMETER(n=2,nm=2000)
      DIMENSION dydx(n),y(n),yout(n)

      alpha = 2.0
      beta = 0.02
      gamma = 0.02
      delta = 1.0
      
      x = 0.0
      h = 0.01
      
      y(1)=100.0
      y(2)=15.0
      
      call derivs(x,y,dydx)
      
      open(unit=3,file='lv-res.dat',status='replace',form='formatted')
      
      do i=1,nm
        write(3,*)x,y(1),y(2)
        x = x+h 
        call derivs(x,y,dydx)
        call rk4(y,dydx,n,x,h,yout,derivs)
        y(1)=yout(1)
        y(2)=yout(2)
      enddo
      
      close(3)
      STOP
      END
