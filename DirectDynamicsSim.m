function ddqDH  = DirectDynamicsSim(u)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tau(:, 1) = u(7:12);
qDH(:, 1) = u(13:18);
dqDH(:, 1) = u(1:6);

ddqDH  = DirectDynamics(tau, qDH, dqDH);
end

