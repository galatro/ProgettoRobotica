function [p, phi, R, A] = cindir(q)
%coefficienti di Denavit-Hartenberg
alpha =     [ pi/2  pi/2    0      pi        0           0   ];
teta  =     [ 0     pi/2    q(3)   q(4)     0           q(6)];
a     =     [ 0     0.35    0.467  0.4005   0           0   ];
d     =     [ q(1)  q(2)    0      0        -0.8285+q(5) 0   ];

%Matrice di rotazione tra la terna 0 e la terna base
Rb0=rotazioneElementare(pi/2,'y')*rotazioneElementare(pi,'z');
Ab0=[Rb0 [0 0 0]';
    0 0 0 1];

A = cell(length(q)+2,1);
A{1}=Ab0;
for i=1:length(q)
    A{i+1}= [cos(teta(i))    -sin(teta(i))*cos(alpha(i))     sin(teta(i))*sin(alpha(i))      a(i)*cos(teta(i));
            sin(teta(i))    cos(teta(i))*cos(alpha(i))      -cos(teta(i))*sin(alpha(i))     a(i)*sin(teta(i));
            0               sin(alpha(i))                    cos(alpha(i))                    d(i);
            0               0                               0                               1]; 
end
A0n=A{2};
for i=3:length(q)+1
    A0n=A0n*A{i};
end

%Matrice di rotazione tra la terna 6 e la terna EE
Rne=rotazioneElementare(pi,'z');
Ane=[Rne [0 0 0.0884]';
    0 0 0 1];
A{length(q)+2} = Ane;

Abe=Ab0*A0n*Ane;
p=Abe(1:3,4);
R=Abe(1:3,1:3);

%rpy
%R=Rz(phi)*Ry(teta)*Rx(psi) 
%ze e xe sono ruotati di 180 alla terna base, per costruzione. 
phi=[atan2(R(2,1),R(1,1)), atan2(-R(3,1),sqrt(R(3,2)^2 + R(3,3)^2)), atan2(R(3,2),R(3,3))]';


