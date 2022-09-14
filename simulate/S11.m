function dxdt = S11 (t,x) %خطای حالت ها با مقدار تخمین زده شده شون.

a = [1 0 1 0;0 0 0 1;2.0587 0 0 .1175;0 0 .1175 0] ;
b = [0 0 1 0;0 0 0 1]' ;
c = [6378 0 0 0] ;
d = 0 ;
[Abar,Bbar,Cbar,T,k]= obsvf(a,b,c)
A_m = Abar(2:4,2:4)
B_m = Bbar(2:4)'
C_m = Cbar(2:4)

a = A_m ; b = B_m ;c = C_m ;

p_tond = [-40 -30] ; %takhmingar
p_d = [-5 -3 -4] ;
k = acker(a,b,p_d) ; % k feedback                  

R = [1 0 0 ; 0 1 0] ;
p = [c;R] ;        % p رنک 3 دارد
a_bar = p*a*inv(p) ;
b_bar = p*b ;
c_bar = c*inv(p) ;

a_bar_11 = a_bar(1:1,1:1);
a_bar_12 = a_bar(1,2:3);
a_bar_21 = a_bar(2:3,1);
a_bar_22 = a_bar(2:3,2:3);
b_bar_1  = b_bar(1:1);
b_bar_2  = b_bar(2:3);
p = inv(p) ;
k_takh = acker(a_bar_22',a_bar_12',p_tond)   ;  % پیدا کردن ماتریس L
L_bar = k_takh' ;         % L takhmingar

dxdt=[a-b*k*p*[c;L_bar*c] -b*k*p*[0 0;1 0;0 1];((a_bar_22-L_bar*a_bar_12)*L_bar+(a_bar_21-L_bar*a_bar_11))*c-(b_bar_2-L_bar*b_bar_1)*k*p*[c;L_bar*c] a_bar_22-L_bar*a_bar_12-(b_bar_2-L_bar*b_bar_1)*k*p*[0 0;1 0;0 1]]*x+[b;b_bar_2-L_bar*b_bar_1];

end 




