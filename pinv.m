function [ pJg ] = pinv( q )
%PINV Summary of this function goes here
%   Detailed explanation goes here
Jg  = JacobianoGeometrico( q );
pJg = eye(6) - Jg*Jg';
end

function [ pJa ] = pinv( q )
%PINV Summary of this function goes here
%   Detailed explanation goes here
Ja  = JacobianoAnalitico( q , 'RPY');
pJa = eye(6) - (Ja'*(Ja*Ja')^-1)*Ja;
end
% 

