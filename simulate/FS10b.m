clc
clear all
a = [1 0 1 0;0 0 0 1;2.0587 0 0 .1175;0 0 .1175 0] ;
b = [0 0 1 0;0 0 0 1]' ;
c = [6378 0 0 0] ;
d = 0 ;
[Abar,Bbar,Cbar,T,k]= obsvf(a,b,c)
A_m = Abar(2:4,2:4)
B_m = Bbar(2:4)'
C_m = Cbar(2:4)

q = rank(c) ;
R = [1 0 0 ; 0 1 0] ;
p = [C_m;R] ;        % p رنک 3 دارد

a = A_m ; b = B_m ;c = C_m ;

a_bar = p*a*inv(p) ;
b_bar = p*b ;
c_bar = c*inv(p) ;

a_bar_11 = a_bar(1:q,1:q);
a_bar_12 = a_bar(1,2:3);
a_bar_21 = a_bar(2:3,1);
a_bar_22 = a_bar(2:3,2:3);
b_bar_1  = b_bar(1:1);
b_bar_2  = b_bar(2:3);

p_d = [-20 -10 ] ;
k = acker(a_bar_22',a_bar_12',p_d)  ;  % پیدا کردن ماتریس L
L_bar = k' ;

x0=[0;0;0;3;3];
[t,x] = ode45(@S10b,[0 1],x0);
% x(1), x(2) ---> z      
% x(2),x(3),x(4) ---> x(states)

x2_hat_bar = L_bar*c*[x(:,3) x(:,4) x(:,5)]' + [x(:,1) x(:,2)]';
y =c*[x(:,3) x(:,4) x(:,5)]';

x_hat_bar=[y;x2_hat_bar];
x_hat = inv(p)*x_hat_bar ;
x_hat = x_hat' ;
size(x_hat);
%x_hat(:,1)
subplot(3,1,1);
plot(t, x(:,3))
legend('x1')

subplot(3,1,2);
plot(t, x(:,4),t, x_hat(:,2),'o');
legend('x2','xhat2')

subplot(3,1,3);
plot(t, x(:,5),t, x_hat(:,3),'o');
legend('x3','xhat3')
