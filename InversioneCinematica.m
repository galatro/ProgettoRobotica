function [q, dq]=InversioneCinematica(q0, xd, dxd)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

tf = 10; %final time
tfsim = 15;
T = 0.001; %sample time

Kp = diag([100 100 10]);
t = (0:T:tf)';

Ja  = JacobianoAnalitico( q , eul)

end

