clc
clear all
close all

load('qd2.mat');
T=0.001;
for i=length(qd):14000
    qd(i,:)=qd(end,:);
end
tf=length(qd)*T;
t=[0:T:tf-T]';
Kp=1200*[1;1;1;1;1;1];
Kd=300*[1;1;1;1;1;1];
sim('PD_gravita2015.slx')

t=[1.8 3.1 2.9 0.29 0.28 5.65]

[limiti,pos, vel, acc, ostac] = controllo_coppia(tau,q, dq, ddq,t)

%%
figure
subplot(3,2,1)
plot(qd(:,1))
hold on
plot(q(:,1))
xlabel('t [s]')
ylabel('q1 [m]')
title('Giunto 1')
subplot(3,2,2)
plot(err(:,1),'lineWidth',2)
hold on
plot(err(:,1)/max(abs(q(:,1))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 1')
subplot(3,2,3)
plot(qd(:,2))
hold on
plot(q(:,2))
xlabel('t [s]')
ylabel('q2 [m]')
title('Giunto 2')
subplot(3,2,4)
plot(err(:,2),'lineWidth',2)
hold on
plot(err(:,2)/max(abs(q(:,2))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 2')
subplot(3,2,5)
plot(qd(:,3))
hold on
plot(q(:,3))
xlabel('t [s]')
ylabel('q3 [rad]')
title('Giunto 3')
subplot(3,2,6)
plot(err(:,3),'lineWidth',2)
hold on
plot(err(:,3)/max(abs(q(:,3))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 3')

figure
subplot(2,2,1)
plot(qd(:,4))
hold on
plot(q(:,4))
xlabel('t [s]')
ylabel('q1 [m]')
title('Giunto 4')
subplot(2,2,2)
plot(err(:,4),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 4')
hold on
plot(err(:,4)/max(abs(q(:,4))),'lineWidth',2)
subplot(2,2,3)
plot(qd(:,6))
hold on
plot(q(:,6))
xlabel('t [s]')
ylabel('q3 [rad]')
title('Giunto 6')
subplot(2,2,4)
plot(err(:,6),'lineWidth',2)
hold on
plot(err(:,6)/max(abs(q(:,6))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 6')

figure
subplot(2,1,1)
plot(qd(:,5))
hold on
plot(q(:,5))
xlabel('t [s]')
ylabel('q2 [m]')
title('Giunto 5')
subplot(2,1,2)
plot(err(:,5),'lineWidth',2)
hold on
plot(err(:,5)/max(abs(q(:,5))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
legend
title('Giunto 5')

%%
load('qd.mat');
T=0.001;
for i=length(qd):14000
    qd(i,:)=qd(end,:);
end
tf=length(qd)*T;
t=[0:T:tf-T]';
Kp=1200*[1;1;1;1;1;1];
Kp(5)=45;
Kd=300*[1;1;1;1;1;1];
Kd(5)=10;

sim('PD_gravita2015.slx')

t=[1.8 3.1 2.9 0.29 0.28 5.65]

[limiti,pos, vel, acc, ostac] = controllo_coppia(tau,q, dq, ddq,t)

%%
figure
subplot(3,2,1)
plot(qd(:,1))
hold on
plot(q(:,1))
xlabel('t [s]')
ylabel('q1 [m]')
title('Giunto 1')
subplot(3,2,2)
plot(err(:,1),'lineWidth',2)
hold on
plot(err(:,1)/max(abs(q(:,1))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 1')
subplot(3,2,3)
plot(qd(:,2))
hold on
plot(q(:,2))
xlabel('t [s]')
ylabel('q2 [m]')
title('Giunto 2')
subplot(3,2,4)
plot(err(:,2),'lineWidth',2)
hold on
plot(err(:,2)/max(abs(q(:,2))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 2')
subplot(3,2,5)
plot(qd(:,3))
hold on
plot(q(:,3))
xlabel('t [s]')
ylabel('q3 [rad]')
title('Giunto 3')
subplot(3,2,6)
plot(err(:,3),'lineWidth',2)
hold on
plot(err(:,3)/max(abs(q(:,3))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 3')

figure
subplot(2,2,1)
plot(qd(:,4))
hold on
plot(q(:,4))
xlabel('t [s]')
ylabel('q1 [m]')
title('Giunto 4')
subplot(2,2,2)
plot(err(:,4),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 4')
hold on
plot(err(:,4)/max(abs(q(:,4))),'lineWidth',2)
subplot(2,2,3)
plot(qd(:,6))
hold on
plot(q(:,6))
xlabel('t [s]')
ylabel('q3 [rad]')
title('Giunto 6')
subplot(2,2,4)
plot(err(:,6),'lineWidth',2)
hold on
plot(err(:,6)/max(abs(q(:,6))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
title('Giunto 6')

figure
subplot(2,1,1)
plot(qd(:,5))
hold on
plot(q(:,5))
xlabel('t [s]')
ylabel('q2 [m]')
title('Giunto 5')
subplot(2,1,2)
plot(err(:,5),'lineWidth',2)
hold on
plot(err(:,5)/max(abs(q(:,5))),'lineWidth',2)
xlabel('t [s]')
ylabel('errore')
legend
title('Giunto 5')

