function dxdt = S10b (t,x) %خطای حالت ها با مقدار تخمین زده شده شون.

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
dxdt=[a_bar_22-L_bar*a_bar_12 ((a_bar_22-L_bar*a_bar_12)*L_bar+a_bar_21-L_bar*a_bar_11)*c ;zeros(3,2) a]*x + [b_bar_2-L_bar*b_bar_1 ; b] ;

end


