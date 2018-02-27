function [ pJa ] = pinvJ( q)
%PINVJ Summary of this function goes here
%   Detailed explanation goes here
% Ja = JacobianoAnalitico( q , 'RPY');
% elimino righe nulle dallo jacobiano analitico
% Ja = [Ja(1:4,:)];
Ja  = JacobianoAnalitico( [0 0 q(3) q(4) 0 0] , 'RPY');
Ja = [Ja(1:4,:)];
pJa = Ja'*(Ja*Ja')^-1;

end

