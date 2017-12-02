clc
clear all

tf = 5; %final time
tfsim = 5.1;
T = 0.001; %sample time

Kp = diag([100 100 100 10]);
t = (0:T:tf)';


p0 = [1.2175,0, 0.7401];
pf = [6.65, -3.15, 0.5175];
pvia = [0.2175 1 0.5401];
phi0 = -pi;
phif = -pi;

[ xd, dxd, ddxd ] = SottoTraiettoria( [p0',pf'], 0, 0, tf );
xd(:,4)=-pi;
dxd = [0 0 0 0 ; diff(xd)/T];

q0 = [0; 0; 0; 0; 0; 0];
