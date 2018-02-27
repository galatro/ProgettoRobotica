function [ x ] = cindirSim( q )
%CINDIRSIM Summary of this function goes here
%   Detailed explanation goes here
[p, phi, R, A] = cindir(q);
phi=mod(phi(1)+2*pi,2*pi);
x=[p; phi];
end

