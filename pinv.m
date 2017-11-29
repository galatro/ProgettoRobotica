function [ pJg ] = pinv( q )
%PINV Summary of this function goes here
%   Detailed explanation goes here
Jg  = JacobianoGeometrico( q );
pJg = eye(6) - Jg*Jg';
end

