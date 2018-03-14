clc
clear all 
close all

T = 0.001; %sample time

Kp = diag([500 500 500 50]);
Kn = diag([1 1 1 1 1 1]);

t_t = [26; 0.29; 0.28; 39; 0.29; 0.28];
tf = sum(t_t)+0.001*(length(t_t)-1); %final time
tfsim = tf+0.010;
t = (0:T:tf)';


p0 = [1.2175; 0; 0.7401];
ppick = [6.65; -3.15; 0.5275];
pf = [5.8; 9; 0.5275];
points = [p0 ppick pf];

[ xd, dxd, ddxd ] = Traiettoria2(points, t_t);

q0=[0 0 0 0 0 0]';
global rect
rect = true;
sim('clik2015');

[pos, vel, acc, ostac] = controllo_limiti(q, dq, ddq,t_t);
if(size(find(pos>0)>0))
    disp(strcat('Posizione violata, ', num2str(size(find(pos>0)>0,1)),' tratti'));
end
if(size(find(vel>0)>0))
    disp(strcat('Velocità violata, ', num2str(size(find(vel>0)>0,1)),' tratti'));
end
if(size(find(acc>0)>0))
    disp(strcat('Accelerazione violata, ', num2str(size(find(acc>0)>0,1)),' tratti'));
end
if(size(find(ostac>0)>0))
    disp(strcat('Distanza dagli ostacoli violata, ', num2str(size(find(ostac>0)>0,1)),' tratti'));
end