clc
clear all
a = [1 0 1 0;0 0 0 1;2.0587 0 0 .1175;0 0 .1175 0] ;
b = [0 0 1 0;0 0 0 1]' ;
c = [6378 0 0 0] ;
d = 0 ;
[Abar,Bbar,Cbar,T,k]= obsvf(a,b,c);
A_m = Abar(2:4,2:4);
B_m = Bbar(2:4)';
C_m = Cbar(2:4);

a = A_m ; b = B_m ;c = C_m ;

p_tond = [-40 -30] ;
p_d = [-6 -1 -2] ;

k = acker(a,b,p_d) ; % k feedback                  

R = [1 0 0 ; 0 1 0] ;
p = [c;R] ;        % p رنک 3 دارد
p = inv(p) ;
a_bar = p*a*inv(p) ;
b_bar = p*b ;
c_bar = c*inv(p) ;

a_bar_11 = a_bar(1:1,1:1);
a_bar_12 = a_bar(1,2:3);
a_bar_21 = a_bar(2:3,1);
a_bar_22 = a_bar(2:3,2:3);
b_bar_1  = b_bar(1:1);
b_bar_2  = b_bar(2:3);

k_takh = acker(a_bar_22',a_bar_12',p_tond)   ;  % پیدا کردن ماتریس L
L_bar = k_takh' ;         % L takhmingar

[t,x] = ode45(@S11,[0 10],[0,0,0,0,0]);

x2_hat_bar =L_bar*c*[x(:,1) x(:,2) x(:,3)]'+ [x(:,4) x(:,5)]';

y=c*[x(:,1) x(:,2) x(:,3)]';

plot(t,y);

legend('Unit Response')

