tic
clc
clear all
close all

T = 0.001; %sample time

Kp = 10*diag([50 50 50 5]);
Kn = diag([1 1 1 1 1 1]);

t_t = [1.8; 3.1; 2.9; 1.2; 1.2; 8.3; 4.1; 3.1; 0.29; 0.28];

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
[ xd, dxd, ddxd ] = Traiettoria(points,obstacle, t_t,true);

close all

q0=[0 0 0 0 0 0]';
global rect
rect = false;

sim('clik2015');
for i=1:size(q,3)
    for j=1:size(q,1)
        q1(i,j)=q(j,1,i);
    end
end

for i=1:size(q,3)
    for j=1:size(q,1)
        q1(i,j)=q(j,1,i);
    end
end

for i=1:size(q,3)
    for j=1:size(q,1)
        dq1(i,j)=dq(j,1,i);
    end
end

for i=1:size(q,3)
    for j=1:size(q,1)
        ddq1(i,j)=ddq(j,1,i);
    end
end

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
    disp(strcat('Distanza dagli ostacoli violata, ', num2str(size(find(pos>0)>0,1)),' tratti'));
end

toc