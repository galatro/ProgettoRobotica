clc
clear all
T = 0.001; %sample time

Kp = diag([500 500 500 50]);
Kn = diag([1 1 1 1 1 5]);


tf = 3;
tfsim = tf+0.010;
t = (0:T:tf)';

%per va di angle, si può andare solo in un senso (in questo caso, senso
%antiorario)
angle0=0;
anglef=2*pi-0.001;

[ xd, dxd, ddxd ] = Traiettoria_RotazioneEE(angle0, anglef, tf);

q0=[0 0 0 0 0 0]';
% [pos vel] = controllo_limiti(q, dq,t_t)