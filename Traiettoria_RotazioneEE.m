function [ xd, dxd, ddxd ] = Traiettoria_RotazioneEE(angle0, anglef, tf)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
T=0.001;
t=0:T:tf;
lphi = norm(anglef - angle0);
sphi = spline([0 tf],[0 0 lphi 0],t); % [0 0 l 0] i valori prima e dopo 0 l sono la velocità iniziale e finale
for i=1:length(t)
    phid(i,1) = angle0 + (anglef-angle0)*sphi(i)/lphi;
end
xd(1:length(t),1)=1.2175;
xd(1:length(t),2)=0.0000;
xd(1:length(t),3)=0.7401;
xd(:,4)=phid(:,1);

dxd = [0 0 0 0; diff(xd)/T];
ddxd = [0 0 0 0; diff(xd)/T];

end

