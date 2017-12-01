function [ q0 ] = q0p( q )
%Q0P Summary of this function goes here
%   Detailed explanation goes here
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);
q5=q(5);
q6=q(6);
q0sym =[ -q1/960000, -q2/960000, -(20000*q3)/3743067, -(20000*q4)/3743067, 1/3 - (2*q5)/3, -q6/(96*pi^2)];
q0 = eval(subs (q0sym))';
end

