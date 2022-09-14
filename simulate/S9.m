function dxdt = S9 (t,x) %خطای حالت ها با مقدار تخمین زده شده شون.

a = [1 0 1 0;0 0 0 1;2.0587 0 0 .1175;0 0 .1175 0] ;
b = [0 0 1 0;0 0 0 1]' ;
c = [6378 0 0 0] ;
d = 0 ;
[Abar,Bbar,Cbar,T,k]= obsvf(a,b,c)
A_m = Abar(2:4,2:4)
B_m = Bbar(2:4)'
C_m = Cbar(2:4)
p_ta = [-25 -30 -20] ;
k = acker(A_m',C_m',p_ta)  ;  % پیدا کردن ماتریس L
L = -k'

a_ta = A_m + L*C_m ;
b_ta = B_m ;

dxdt = a_ta*x ;


end 




