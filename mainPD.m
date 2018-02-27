clc
clear all
close all

load('qd2.mat');
T=0.001;
for i=length(qd):length(qd)+3000
    qd(i,:)=qd(end,:);
end
tf=length(qd)*T;
t=[0:T:tf-T]';
Kp=100000*ones(6,1);
Kd=500*ones(6,1);

sim('PD_gravita2015.slx')

figure(1)
plot(qd(:,1))
%hold on
figure(3)
plot(q(:,1))
legend('qd','q')

figure(2)
plot(qd(:,2))
% hold on
figure(4)
plot(q(:,2))
legend('qd','q')