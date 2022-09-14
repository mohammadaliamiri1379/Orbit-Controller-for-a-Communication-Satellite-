clc
clear all
[t,x] = ode45(@S10, [0 3] , [3,3]) ;
subplot(2,1,1) 
plot(t,x(:,1)) ;
legend('errorX1') ;
subplot(2,1,2) 
plot(t,x(:,2)) ;
legend('errorX2') ;
