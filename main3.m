clc
clear all 
close all

T = 0.001; %sample time

Kp = diag([500 500 500 50]);
Kn = diag([1 1 1 1 1 1]);

t_t = [2.5; 6; 3.25; 0.29; 0.27; 8.8; 5.5; 3; 0.29; 0.28];

%retta + circonferenza + retta + pickDown + pickUp + retta + circonferenza
%+ retta + pickDown + pickUp
tf = sum(t_t)+0.001*(length(t_t)-1); %final time
tfsim = tf+0.010;
t = (0:T:tf)';


p0 = [1.2175; 0; 0.7401];
ppick = [6.65; -3.15; 0.5275];
pf = [5.8; 9; 0.5275];
points = [p0 ppick pf];

obstacle1 = [2.875; -1.5; 0.2];
obstacle2 = [6.0; 5.2; 0.2];
obstacle = [obstacle1 obstacle2];
[ xd, dxd, ddxd ] = Traiettoria3(points,obstacle, t_t);


q0=[0 0 0 0 0 0]';
% [pos vel] = controllo_limiti(q, dq,t_t)


