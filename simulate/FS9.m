clc
clear all
[t,x] = ode45(@S9 , [0 1] , [1,1,5]) ;
subplot(2,2,1) 
plot(t,x(:,1)) 

subplot(2,2,2) 
plot(t,x(:,2)) 

subplot(2,2,3) 
plot(t,x(:,3)) 

