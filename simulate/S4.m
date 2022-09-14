clc
clear all
a = [0 0 1 0;0 0 0 1;2.0587 0 0 .1175;0 0 .1175 0] ;
b = [0 0 1 0;0 0 0 1]' ;
c = [6378 0 0 0] ;
d = 0 ;

[Abar,Bbar,Cbar,T,k]= obsvf(a,b,c)
A_m = Abar(2:4,2:4)
B_m = Bbar(2:4)
C_m = Cbar(2:4)
rank(obsv(A_m,C_m))