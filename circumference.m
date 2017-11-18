function [ C, r ] = circumference( p )
%CIRCUMFERENCE Summary of this function goes here
%   Detailed explanation goes here
syms Cx;
syms Cy;
syms r;

for i=1:3
    eq(i)= (p(1,i)-Cx)^2 + (p(2,i)-Cy)^2 - r^2;
end
sol=solve(eq(1),eq(2),eq(3),Cx,Cy,r);
C=eval([sol.Cx(2) ; sol.Cy(2); p(3,1)]);
r=eval(abs (sol.r(2)));
end

