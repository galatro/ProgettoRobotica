function [ pJa ] = pinvJ( q)
%PINVJ Summary of this function goes here
%   Detailed explanation goes here

Ja = JacobianoAnalitico( q , 'ZYZ');
%elimino righe nulle dallo jacobiano analitico
Ja = Ja (1:4,:);
pJa = Ja'*(Ja*Ja')^-1;
end

