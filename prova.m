tf = 3; %final time
tfsim = 3.1;
T = 0.001; %sample time

Kp = diag([10 10 10 10]);
t = (0:T:tf)';


p0 = [1.2175,0, 0.7401];
pf = [1.2175, 2, 0.7401];
pvia = [0.2175 1 0.5401];
phi0 = pi;
phif = pi;

[ xd, dxd, ddxd ] = SottoTraiettoria( [p0', pvia' ,pf'], 0, 0, tf );
xd(:,4)=pi;
dxd = [0 0 0 0 ; diff(xd)/T];

q0 = [0; 0; 0; 0; 0; 0];

plot(dxd)

