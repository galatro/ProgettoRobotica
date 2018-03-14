function [ xd, dxd, ddxd ] = Traiettoria( points, obstacle, t, smorz)

%TRAIETTORIA Summary of this function goes here
%   Detailed explanation goes here
%pianificazione traiettoria completa

%TRAIETTORIA PRIMO OSTACOLO
T=0.001;
p0 = points (1:3,1);
ppick = points (1:3,2);
ppickaway = [ppick(1:2, 1); ppick(3)+0.05];
pf = points (1:3,3);
pfaway = [pf(1:2, 1); pf(3)+0.05];

obstacle1 = obstacle(1:3,1);
obstacle2 = obstacle(1:3,2);

%vettore tempi percorso singolo
%t = [3; 3; 3; 1; 1; 3; 3; 3; 1; 1];
%retta + circonferenza + retta + pickDown + pickUp + retta + circonferenza
%+ retta + pickDown + pickUp

coefficients = polyfit([p0(1), ppick(1)], [p0(2), ppick(2)], 1);
m = coefficients (1);
q = coefficients (2);

syms x;
eq = (x-obstacle1(1))^2+(m*x+q-obstacle1(2))^2-1;
sol = solve (eq,x);
pfermata = eval([sol(1); m*sol(1)+q; p0(3)]);
pfermata2 = eval([sol(2); m*sol(2)+q; p0(3)]);
norm (pfermata(1:2)-obstacle1(1:2));
norm (pfermata2(1:2)-obstacle1(1:2));

%calcolo pvia tra pfermata e pfermata2
%retta perpendicolare alla retta tra posizione iniziale e finale passerà
%per il punto medio tra pfermata e pfermata2
pmedio = ( pfermata + pfermata2 ) / 2;
%pvia è il punto sulla retta data da pmedio e obstacle a distanza 1m da
%obstacle
coefficients = polyfit([obstacle1(1), pmedio(1)], [obstacle1(2), pmedio(2)], 1);
m = coefficients (1);
q = coefficients (2);

%troviamo punto appartentente a tale retta che si trova a circa 1m
%dall'ostacolo --> pvia
syms x;
eq = (x-obstacle1(1))^2+(m*x+q-obstacle1(2))^2-1;
sol = solve (eq,x);
pvia = eval([sol(2); m*sol(2)+q; p0(3)]);
norm (pvia(1:2)-obstacle1(1:2));

%retta da p0 a pfermata
points = [p0 pfermata];
v0 = 0;
vf = 0;
xd = SottoTraiettoria( points, v0, vf, t(1) );
xd(:,4)=0;
dxd = [0 0 0 0; diff(xd)/T];
ddxd = [0 0 0 0; diff(dxd)/T];

%circonferenza da pfermata a pfermata2 passando per pvia
points = [pfermata pvia pfermata2];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(2) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];

xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

plot (xd(:,1), xd(:,2),'b')
hold on
plot (obstacle1(1), obstacle1(2), '+k')
plot (pvia(1), pvia(2), 'ok')

%smorzatura
if smorz
    t0 = 700;
    tf = 4000;
    [ xd, dxd ] = smorzatura( xd, dxd, t0, tf, T );
    %plot (xd(:,1), xd(:,2),'k')
end
%retta da pfermata2 a ppick+5cm 
points = [pfermata2 ppickaway];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(3) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

plot (xd2(:,1), xd2(:,2),'b')


%smorzatura
if smorz
    t0 = 3600;
    tf = 6600;
    [ xd, dxd ] = smorzatura( xd, dxd, t0, tf, T );
    plot (xd(:,1), xd(:,2),'k')
end

%movimento sull'asse z per il prelievo dell'oggetto
points = [ppickaway ppick];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(4) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

points = [ppick ppickaway];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(5) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];


%%
%TRAIETTORIA SECONDO OSTACOLO

coefficients = polyfit([ppick(1), pf(1)], [ppick(2), pf(2)], 1);
m = coefficients (1);
q = coefficients (2);

syms x;
eq = (x-obstacle2(1))^2+(m*x+q-obstacle2(2))^2-1;
sol = solve (eq,x);
pfermata2 = eval([sol(1); m*sol(1)+q; ppickaway(3)]);
pfermata = eval([sol(2); m*sol(2)+q; ppickaway(3)]);
norm (pfermata(1:2)-obstacle2(1:2));
norm (pfermata2(1:2)-obstacle2(1:2));
%calcolo pvia tra pfermata e pfermata2
%retta perpendicolare alla retta tra posizione iniziale e finale passerà
%per il punto medio tra pfermata e pfermata2
pmedio = ( pfermata + pfermata2 ) / 2;
%pvia è il punto sulla retta data da pmedio e obstacle a distanza 1m da
%obstacle
coefficients = polyfit([obstacle2(1), pmedio(1)], [obstacle2(2), pmedio(2)], 1);
m = coefficients (1);
q = coefficients (2);

%troviamo punto appartentente a tale retta che si trova a circa 1m
%dall'ostacolo --> pvia
syms x;
eq = (x-obstacle2(1))^2+(m*x+q-obstacle2(2))^2-1;
sol = solve (eq,x);

pvia = eval([sol(1); m*sol(1)+q; ppickaway(3)]);
norm (pvia(1:2)-obstacle2(1:2));
%retta da p0 a pfermata
points = [ppickaway pfermata];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(6) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

plot (xd2(:,1), xd2(:,2))

%circonferenza da pfermata a pfermata2 passando per pvia
points = [pfermata pvia pfermata2];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(7) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

plot (xd2(:,1), xd2(:,2),'b')

%smorzatura
if smorz
    t0 = 15300;
    tf = 18800;
    [ xd, dxd ] = smorzatura( xd, dxd, t0, tf, T );
    plot (xd(:,1), xd(:,2),'k')
end
plot (obstacle2(1), obstacle2(2))


%retta da pfermata2 a pf
points = [pfermata2 pfaway];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(8) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

plot (xd2(:,1), xd2(:,2),'b')
%smorzatura
if smorz
    t0 = 18500;
    tf = 23000;
    [ xd, dxd ] = smorzatura( xd, dxd, t0, tf, T );
    plot (xd(:,1), xd(:,2),'k')
end

figure (2)
plot (dxd(:,1))
title('velocità x')
figure (3)
plot (dxd(:,2))
title('velocità y')
%movimento sull'asse z per la posa dell'oggetto
points = [pfaway pf];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(9) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

points = [pf pfaway];
v0 = 0;
vf = 0;
xd2 = SottoTraiettoria( points, v0, vf, t(10) );
xd2(:,4)=0;
dxd2 = [0 0 0 0; diff(xd2)/T];
ddxd2 = [0 0 0 0; diff(dxd2)/T];
xd = [xd;xd2];
xd(:,4)=pi;
dxd = [dxd;dxd2];
ddxd = [ddxd;ddxd2];

figure (4)
plot3 (xd(:,1), xd(:,2), xd(:,3))
hold on
plot3 (p0(1), p0(2), p0(3), 'xk')
plot3 (ppick(1), ppick(2), ppick(3), 'xk')
plot3 (pf(1), pf(2), pf(3), 'xk')
plot3 (obstacle1(1), obstacle1(2), obstacle1(3)+0.5401, 'ok')
plot3 (obstacle2(1), obstacle2(2), obstacle2(3)+0.3675, 'ok')
plot3 (ppickaway(1), ppickaway(2), ppickaway(3), '+k')
plot3 (pfaway(1), pfaway(2), pfaway(3), '+k')

end

