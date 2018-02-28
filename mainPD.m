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
Kp=100*[1;1;1;1;0.3;1];
Kd=150*[1;1;1;1;0.3;1];
%aumentare KP aumenta l'oscillazione, aumentare Kd aumenta la velocità

sim('PD_gravita2015.slx')

figure(1)
plot(qd(:,1))
hold on
plot(q(:,1))
legend('qd','q')

figure(2)
plot(qd(:,2))
hold on
plot(q(:,2))
legend('qd','q')

[limiti] = controllo_coppia(tau)