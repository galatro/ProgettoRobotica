function [ q0 ] = q0p( q )
%Q0P Summary of this function goes here
%   Detailed explanation goes here
syms q1 q2 q3 q4 q5 q6;
qsym=[q1 q2 q3 q4 q5 q6];
Jg=JacobianoGeometrico(qsym);
Jg = [Jg(1:3,:);Jg(6,:)];
%condizione di 
w1 = sqrt (det (Jg*Jg'));
n = 6 ;
limiti_giunto_inf = [-200 -200 -2.7925  -2.7925 0 -2*pi];   %m m rad rad m rad
limiti_giunto_sup = [ 200  200  2.7925   2.7925 0.5 2*pi]; %m m rad rad m  rad
w2 = 0;
for (i = 1 : n) 
    qi_medio = limiti_giunto_inf (i) + limiti_giunto_sup (i);
    w2 =  w2+((qsym(i) - qi_medio) / (limiti_giunto_sup (i) - limiti_giunto_inf (i)));
end
    w2 = (-1/(2*n)) * w2;

w = w1+w2;
q0sym = gradient (w);
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);
q5=q(5);
q6=q(6);

q0 = subs (q0sym);
end
