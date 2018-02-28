clc
clear all 

T = 0.001; %sample time

Kp = diag([500 500 500 50]);
Kn = diag([1 1 1 1 1 1]);

t_t = [26; 0.5; 0.5; 39; 0.5; 0.5];
tf = sum(t_t)+0.001*(length(t_t)-1); %final time
tfsim = tf+0.010;
t = (0:T:tf)';


p0 = [1.2175; 0; 0.7401];
ppick = [6.65; -3.15; 0.5275];
pf = [5.8; 9; 0.5275];
points = [p0 ppick pf];

[ xd, dxd, ddxd ] = Traiettoria2(points, t_t);

q0=[0 0 0 0 0 0]';
