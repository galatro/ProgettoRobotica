function [ x ] = cindirSim( q )
%CINDIRSIM Summary of this function goes here
%   Detailed explanation goes here
[p, phi, R, A] = cindir(q);
x = [p ; phi(1)];
end

