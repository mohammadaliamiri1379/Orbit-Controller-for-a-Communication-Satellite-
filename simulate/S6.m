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
d_p = [-5,-3,-4] ;

k = acker(A_m , B_m, d_p) 
A_m = A_m - B_m*k ;
sys = ss(A_m,B_m,C_m,d) ;
step(sys)
[n,d]= ss2tf(A_m,B_m,C_m,d) 
roots(n)
roots(d)
