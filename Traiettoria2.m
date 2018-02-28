function [xd dxd ddxd] = Traiettoria2(points, t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
T=0.001;
p0 = points (1:3,1);
ppick = points(1:3,2);
ppickaway = [ppick(1:2, 1); ppick(3)+0.05];
pf = points (1:3,3);
pfaway = [pf(1:2, 1); pf(3)+0.05];

v0 = 0;
vf = 0;
points=[p0,ppickaway];
xd = SottoTraiettoria( points, v0, vf, t(1) );

%movimento sull'asse z per il prelievo dell'oggetto
points = [ppickaway ppick];
xd2 = SottoTraiettoria( points, v0, vf, t(2) );
xd = [xd;xd2];

points = [ppick ppickaway];
xd2 = SottoTraiettoria( points, v0, vf, t(3) );
xd = [xd;xd2];

%tratto rettilineo
points = [ppickaway pfaway];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(4) );
xd = [xd;xd2];

%movimento sull'asse z per la posa dell'oggetto
points = [pfaway pf];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(5) );
xd = [xd;xd2];

points = [pf pfaway];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(6) );
xd = [xd;xd2];

xd(:,4)=pi;
dxd = [0 0 0 0; diff(xd)/T];
ddxd = [0 0 0 0; diff(xd)/T];
end

