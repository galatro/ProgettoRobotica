function [ pJa ] = pinv( q )
%PINV Summary of this function goes here
%   Detailed explanation goes here
Ja  = JacobianoAnalitico( [0 0 q(3) q(4) 0 0] , 'RPY');
Ja = [Ja(1:4,:)];
pJa = eye(6) - (Ja'*(Ja*Ja')^-1)*Ja;
end
% 

