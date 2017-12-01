function [p, phi, R, A] = cindir(q)
alpha = [pi/2 pi/2 0 0 0 0];
teta = [0 pi/2 q(3) q(4) 0 q(6)];
a = [ 0 0.35 0.467 0.4005 0 0];
d = [q(1) q(2) 0 0.8735 q(5)-0.045-0.0884 0];

R0b=rotazioneElementare(pi/2,'y')*rotazioneElementare(pi,'z');
A0b=[R0b [0 0 0]',
    0 0 0 1];

A = cell(length(q)+2,1);
A{1}=A0b;
for i=1:length(q)
    A{i+1}= [cos(teta(i))    -sin(teta(i))*cos(alpha(i))     sin(teta(i))*sin(alpha(i))      a(i)*cos(teta(i)),
            sin(teta(i))    cos(teta(i))*cos(alpha(i))      -cos(teta(i))*sin(alpha(i))     a(i)*sin(teta(i)),
            0               sin(alpha(i))                    cos(alpha(i))                    d(i),
            0               0                               0                               1]; 
end
An0=A{2};
for i=3:length(q)+1
    An0=An0*A{i};
end

Ren=rotazioneElementare(pi,'y');
Aen=[Ren [0 0 0]',
    0 0 0 1];
A{length(q)+2} = Aen;

Abe=A0b*An0*Aen;
p=Abe(1:3,4);
R=Abe(1:3,1:3);
%rpy
%R=Rz(phi)*Ry(teta)*Rx(psi) 
%ze e xe sono ruotati di 180 alla terna base, per costruzione. 
phi=[atan2(R(2,1),R(1,1)), atan2(-R(3,1),sqrt(R(3,2)^2 + R(3,3)^2)), atan2(R(3,2),R(3,3))]';


