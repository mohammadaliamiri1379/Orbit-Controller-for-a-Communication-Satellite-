clc
clear all
a = [0 0 1 0;0 0 0 1;2.0587 0 0 .1175;0 0 .1175 0] ;
b = [0 0 1 0;0 0 0 1]' ;
c = [6378 0 0 0] ;
d = 0 ;
% matrix [B AB ... ] , [c ca ca^2 ...]' 
A = ctrb(a ,b ) 
B = obsv(a ,c) 
r_A= rank(A)
r_B = rank(B) 

[Abar,Bbar,Cbar,T,k]= obsvf(a,b,c)
eig(Abar)
