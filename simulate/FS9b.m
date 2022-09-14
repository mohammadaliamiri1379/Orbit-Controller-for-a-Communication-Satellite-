clc
clear all
[t,x] = ode45(@S9b, [0 3] , [4,-4,10,0,0,0]) ;
subplot(2,3,1) 
plot(t,x(:,1)) ;
legend('X1') ;
subplot(2,3,2) 
plot(t,x(:,2)) ;
legend('X2') ;

subplot(2,3,3) 
plot(t,x(:,3)) ;
legend('X3') ;

subplot(2,3,4) 
plot(t,x(:,4)) ;
legend('X1had') ;

subplot(2,3,5) 
plot(t,x(:,5)) ;
legend('X2had') ;

subplot(2,3,6) 
plot(t,x(:,6)) ;
legend('X3had') ;