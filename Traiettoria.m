function [ xd, dxd, ddxd ] = Traiettoria( points, obstacle )
%TRAIETTORIA Summary of this function goes here
%   Detailed explanation goes here
%pianificazione traiettoria completa

%retta dal punto iniziale alla posizione di pick --> sfruttiamo ridondanza
% p0 = [1.2175; 0; 0.7401];
% pf = [6.65; -3.15; 0.5175];
% points = [p0 pf];
% v0 = 0;
% vf = 0;
% tf = 10;
% [ xd, dxd, ddxd ] = SottoTraiettoria( points, v0, vf, tf );


%retta dal punto iniziale / circonferenza intorno all'ostacolo/ retta verso
%la posizione di pick
p0 = [1.2175; 0; 0.7401];
pf = [6.65; -3.15; 0.5175];
points = [p0 pf];
v0 = 0;
vf = 0;
tf = 10;
[ xd, dxd, ddxd ] = SottoTraiettoria( points, v0, vf, tf );

%troviamo punto sulla retta a distanza 1m dall ostacolo --> pfermata
for i=1:size (xd,1)
    if (abs((sqrt((xd(i,1)-obstacle(1))^2 + (xd(i,2)-obstacle(2))^2))- 1) < 10^-3 )
        pfermata = (xd (i,:))';
        break;
    end
end

%troviamo punto sulla retta a distanza 1m dall ostacolo --> pfermata2
for i=size (xd,1):-1:1
    if (abs((sqrt((xd(i,1)-obstacle(1))^2 + (xd(i,2)-obstacle(2))^2))- 1) < 10^-3 )
        pfermata2 = (xd (i,:))';
        break;
    end
end

%calcolo pvia tra pfermata e pfermata2
%retta perpendicolare alla retta tra posizione iniziale e finale passerà
%per il punto medio tra pfermata e pfermata2
pmedio = ( pfermata + pfermata2 ) / 2;
%pvia è il punto sulla retta data da pmedio e obstacle a distanza 1m da
%obstacle
coefficients = polyfit([obstacle(1), pmedio(1)], [obstacle(2), pmedio(2)], 1);
m = coefficients (1);
q = coefficients (2);

%troviamo punto appartentente a tale retta che si trova a circa 1m
%dall'ostacolo --> pvia
syms x;
eq = (x-obstacle(1))^2+(m*x+q-obstacle(2))^2-1;
sol = solve (eq,x);
if ( (abs(sqrt((sol(1)-pmedio(1))^2 + (m*sol(1)+q-pmedio(2))^2))) <  (abs(sqrt((sol(2)-pmedio(1))^2 + (m*sol(2)+q-pmedio(2))^2))) )
    pvia = eval([sol(1); m*sol(1)+q; 0]);
else
    pvia = eval([sol(2); m*sol(2)+q; 0]);
end

%retta da p0 a pfermata
points = [p0 pfermata];
v0 = 0;
vf = 0;
tf = 10;
[ xd, dxd, ddxd ] = SottoTraiettoria( points, v0, vf, tf );


%circonferenza da pfermata a pfermata2 passando per pvia
points = [pfermata pvia pfermata2];
v0 = 0;
vf = 0;
tf = 10;
[ xd2, dxd2, ddxd2 ] = SottoTraiettoria( points, v0, vf, tf );

xd = [xd;xd2];

%retta da pfermata2 a pf
pf = [6.65; -3.15; 0.5175];
points = [pfermata2 pf];
v0 = 0;
vf = 0;
tf = 10;
[ xd3, dxd3, ddxd3 ] = SottoTraiettoria( points, v0, vf, tf );
xd = [xd;xd3];

%plot traiettoria ottenuta
plot (xd(:,1), xd(:,2))
hold on
plot (p0(1), p0(2), 'xr')
hold on
plot (pfermata(1), pfermata(2), 'xg')
hold on 
plot (obstacle(1), obstacle(2), 'xk')
hold on
plot (pvia(1), pvia(2), 'xy')
hold on
plot (pfermata2(1), pfermata2(2), 'xm')
hold on
plot (pf(1), pf(2), 'xc')



end

