tf = 10; %final time
tfsim = 15;
T = 0.001; %sample time

Kp = diag([100 100 10 10]);
t = (0:T:tf)';


p0 = [2, 2, 0.6];
pf = [2.5, 2, 0.6];
phi0 = 0;
phif = pi/4;

%ascissa curvilinea
l = norm (pf-p0); %lunghezza segmento
%secondo vettore spline primo e ultimo elemento sono le velocità di inizio
%e fine
s = spline ([0 tf], [0 0 l 0], t); %devo andare da 0 a l in tempo tf

%per ogni campione dell ascissa curvilinea mi calcolo xd --> componenti x e
%y
for i=1:length (t)
    pd (i,:) = p0+(pf-p0)*s(i)/l;
end

%ascissa curvilinea per orientamento
sphi = s/l*norm (phif-phi0);
lphi = norm (phif-phi0);
for i=1:length (t)
    phid(i, 1) = phi0+(phif-phi0)*sphi(i)/lphi;
end

xd = [pd phid];
%rapporto incrementale con diff
dxd = [0 0 0 0; diff(xd)/T];

q0 = [0; 0; 0; 0; 0; 0];
