obstacle1 = [2.875; -1.5; 0.2];
obstacle2 = [6.0; 5.2; 0.2];
a=[0:0.0001:2*pi];
figure
plot(xd(:,1),xd(:,2),'k', 'lineWidth',1.3)
hold on
plot(q(1,:),q(2,:),'b', 'lineWidth',1.3)
plot(ppick(1),ppick(2),'o')
plot(pf(1),pf(2),'o')
plot(obstacle1(1),obstacle1(2),'+')
plot(obstacle2(1),obstacle2(2),'+')
plot(obstacle1(1)+cos(a),obstacle1(2)+sin(a),'--k')
plot(obstacle2(1)+cos(a),obstacle2(2)+sin(a),'--k')
xlabel('coordinata x [m]')
ylabel('coordinata y [m]')
legend
%spazio operativo
figure
subplot(2,2,1)
plot(xd(:,1))
xlabel('t [s]')
ylabel('coordinata [m]')
title('x')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,2)
plot(xd(:,2))
xlabel('t [s]')
ylabel('coordinata [m]')
title('y')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,3)
plot(xd(:,3))
xlabel('t [s]')
ylabel('coordinata [m]')
title('z')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,4)
plot(xd(:,4))
xlabel('t [s]')
ylabel('coordinata [rad]')
title('?')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})


%errore
figure
subplot(2,2,1)
plot(err(1,:))
xlabel('t [s]')
ylabel('errore [m]')
title('x')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,2)
plot(err(2,:))
xlabel('t [s]')
ylabel('errore [m]')
title('y')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,3)
plot(err(3,:))
xlabel('t [s]')
ylabel('errore [m]')
title('z')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,4)
plot(err(4,:))
xlabel('t [s]')
ylabel('errore [rad]')
title('?')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

o1 = [2.875 -1.5];
o2 = [6.0 5.2];
% distanza dagli ostacoli
for i=1:size(q,3)
    p=[q(1,1,i) q(2,1,i)];
    n1(i)=norm(p-o1);
    n2(i)=norm(p-o2);
end

figure
subplot(2,1,1)
plot(n1)
hold on
plot(ones(1,size(q,3)),'lineWidth',2)
xlabel('t [s]')
ylabel('distanza [m]')
title('ostacolo 1')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,1,2)
plot(n2)
hold on
plot(ones(1,size(q,3)),'lineWidth',2)
xlabel('t [s]')
ylabel('distanza [m]')
title('ostacolo 2')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

% posizione
limiti_giunto_inf = [-200 -200 -2.7925  -2.7925 0 -2*pi];   %m m rad rad m rad
limiti_giunto_sup = [ 200  200  2.7925   2.7925 0.5 2*pi]; %m m rad rad m  rad

figure
subplot(2,2,1)
plot(q(3,:))
hold on
plot(limiti_giunto_sup(3)*ones(1,size(q,3)))
plot(limiti_giunto_inf(3)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('angolo [rad]')
title('Giunto 3')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,2)
plot(q(4,:))
hold on
plot(limiti_giunto_sup(4)*ones(1,size(q,3)))
plot(limiti_giunto_inf(4)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('angolo [rad]')
title('Giunto 4')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,3)
plot(q(5,:))
hold on
plot(limiti_giunto_sup(5)*ones(1,size(q,3)))
plot(limiti_giunto_inf(5)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('posizione [m]')
title('Giunto 5')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(2,2,4)
plot(q(6,:))
hold on
plot(limiti_giunto_sup(6)*ones(1,size(q,3)))
plot(limiti_giunto_inf(6)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('angolo [rad]')
title('Giunto 6')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

% velocità
limiti_giunto_inf = -[  1    1     4       4     0.8   5]; %velocita' massime ai giunti m/s m/s rad/s  rad/s m/s rad/s
limiti_giunto_sup = [  1    1     4       4     0.8   5]; %velocita' massime ai giunti m/s m/s rad/s  rad/s m/s rad/s

figure
subplot(3,2,1)
plot(dq(1,:))
hold on
plot(limiti_giunto_sup(1)*ones(1,size(q,3)))
plot(limiti_giunto_inf(1)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('v [m/s]')
title('Giunto 1')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,2)
plot(dq(2,:))
hold on
plot(limiti_giunto_sup(2)*ones(1,size(q,3)))
plot(limiti_giunto_inf(2)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('v [m/s]')
title('Giunto 2')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,3)
plot(dq(3,:))
hold on
plot(limiti_giunto_sup(3)*ones(1,size(q,3)))
plot(limiti_giunto_inf(3)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('v [rad/s]')
title('Giunto 3')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,4)
plot(dq(4,:))
hold on
plot(limiti_giunto_sup(4)*ones(1,size(q,3)))
plot(limiti_giunto_inf(4)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('v [rad/s]')
title('Giunto 4')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,5)
plot(dq(5,:))
hold on
plot(limiti_giunto_sup(5)*ones(1,size(q,3)))
plot(limiti_giunto_inf(5)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('v [m/s]')
title('Giunto 5')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,6)
plot(dq(6,:))
hold on
plot(limiti_giunto_sup(6)*ones(1,size(q,3)))
plot(limiti_giunto_inf(6)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('v [rad/s]')
title('Giunto 6')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

% accelerazione

ddqmax      = [  3    3    20      20       5  20]; %accelerazioni massime ai giunti m/s^2 m/s^2 rad/s^2 rad/s^2 m/s^2 rad/s^2
limiti_giunto_inf = -ddqmax;
limiti_giunto_sup = ddqmax;

figure
subplot(3,2,1)
plot(ddq(1,:))
hold on
plot(limiti_giunto_sup(1)*ones(1,size(q,3)))
plot(limiti_giunto_inf(1)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('acc [m/s^{2}]')
title('Giunto 1')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,2)
plot(ddq(2,:))
hold on
plot(limiti_giunto_sup(2)*ones(1,size(q,3)))
plot(limiti_giunto_inf(2)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('acc [m/s^{2}]')
title('Giunto 2')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,3)
plot(ddq(3,:))
hold on
plot(limiti_giunto_sup(3)*ones(1,size(q,3)))
plot(limiti_giunto_inf(3)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('acc [rad/s^{2}]')
title('Giunto 3')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,4)
plot(ddq(4,:))
hold on
plot(limiti_giunto_sup(4)*ones(1,size(q,3)))
plot(limiti_giunto_inf(4)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('acc [rad/s^{2}]')
title('Giunto 4')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,5)
plot(ddq(5,:))
hold on
plot(limiti_giunto_sup(5)*ones(1,size(q,3)))
plot(limiti_giunto_inf(5)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('acc [m/s^{2}]')
title('Giunto 5')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})

subplot(3,2,6)
plot(ddq(6,:))
hold on
plot(limiti_giunto_sup(6)*ones(1,size(q,3)))
plot(limiti_giunto_inf(6)*ones(1,size(q,3)))
xlabel('t [s]')
ylabel('acc [rad/s^{2}]')
title('Giunto 6')
xticks([0 5000 10000 15000 20000 25000])
xticklabels({'0','5','10','15','20','25'})