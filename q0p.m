function [ q0 ] = q0p( q )
%Q0P Summary of this function goes here
%   Detailed explanation goes here
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);
q5=q(5);
q6=q(6);
%dw1=[ 0, 0, -(0.5*(5.342e-17*sin(q3)*sin(q3) - 1.308e-32*cos(q3)*sin(q3) - 1.308e-32*sin(q3)*cos(q3) - 5.342e-17*cos(q3)*cos(q3) - 2.29e-17*cos(q3)*cos(q3)*cos(q4) - 5.61e-33*cos(q3)*cos(q3)*sin(q4) - 5.61e-33*cos(q3)*cos(q4)*sin(q3) - 5.61e-33*sin(q3)*cos(q3)*cos(q4) + 2.29e-17*cos(q3)*sin(q3)*sin(q4) + 2.29e-17*sin(q3)*cos(q3)*sin(q4) + 2.29e-17*sin(q3)*cos(q4)*sin(q3) + 5.61e-33*sin(q3)*sin(q3)*sin(q4) - 2.29e-17*cos(q3)*cos(q4)*cos(q3) - 5.61e-33*cos(conj(q3))*cos(conj(q4))*sin(q3) - 5.61e-33*cos(conj(q3))*sin(conj(q4))*cos(q3) - 5.61e-33*cos(conj(q4))*sin(conj(q3))*cos(q3) + 2.29e-17*cos(conj(q3))*sin(conj(q4))*sin(q3) + 2.29e-17*cos(conj(q4))*sin(conj(q3))*sin(q3) + 2.29e-17*sin(conj(q3))*sin(conj(q4))*cos(q3) + 5.61e-33*sin(conj(q3))*sin(conj(q4))*sin(q3) - 3.929e-17*cos(conj(q3))*cos(conj(q4))*cos(q3)*cos(q4) - 9.622e-33*cos(conj(q3))*cos(conj(q4))*cos(q3)*sin(q4) - 9.622e-33*cos(conj(q3))*cos(conj(q4))*cos(q4)*sin(q3) - 9.622e-33*cos(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) - 9.622e-33*cos(conj(q4))*sin(conj(q3))*cos(q3)*cos(q4) + 3.929e-17*cos(conj(q3))*cos(conj(q4))*sin(q3)*sin(q4) + 3.929e-17*cos(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) + 3.929e-17*cos(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) + 3.929e-17*cos(conj(q4))*sin(conj(q3))*cos(q3)*sin(q4) + 3.929e-17*cos(conj(q4))*sin(conj(q3))*cos(q4)*sin(q3) + 3.929e-17*sin(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) + 9.622e-33*cos(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4) + 9.622e-33*cos(conj(q4))*sin(conj(q3))*sin(q3)*sin(q4) + 9.622e-33*sin(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) + 9.622e-33*sin(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) - 3.929e-17*sin(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4)))/(0.4362*cos(conj(q3))*cos(q3) + 2.671e-17*cos(conj(q3))*sin(q3) + 2.671e-17*sin(conj(q3))*cos(q3) + 0.4362*sin(conj(q3))*sin(q3) + 0.187*cos(conj(q3))*cos(q3)*cos(q4) + 1.145e-17*cos(conj(q3))*cos(q3)*sin(q4) + 1.145e-17*cos(conj(q3))*cos(q4)*sin(q3) + 1.145e-17*sin(conj(q3))*cos(q3)*cos(q4) - 0.187*cos(conj(q3))*sin(q3)*sin(q4) + 0.187*sin(conj(q3))*cos(q3)*sin(q4) + 0.187*sin(conj(q3))*cos(q4)*sin(q3) - 1.145e-17*sin(conj(q3))*sin(q3)*sin(q4) + 0.187*cos(conj(q3))*cos(conj(q4))*cos(q3) + 1.145e-17*cos(conj(q3))*cos(conj(q4))*sin(q3) + 1.145e-17*cos(conj(q3))*sin(conj(q4))*cos(q3) + 1.145e-17*cos(conj(q4))*sin(conj(q3))*cos(q3) + 0.187*cos(conj(q3))*sin(conj(q4))*sin(q3) + 0.187*cos(conj(q4))*sin(conj(q3))*sin(q3) - 0.187*sin(conj(q3))*sin(conj(q4))*cos(q3) - 1.145e-17*sin(conj(q3))*sin(conj(q4))*sin(q3) + 0.03498*cos(conj(q3))^2*sin(conj(q4))*cos(q3)^2*sin(q4) + 0.03498*cos(conj(q3))^2*sin(conj(q4))*sin(q3)^2*sin(q4) + 0.03498*sin(conj(q3))^2*sin(conj(q4))*cos(q3)^2*sin(q4) + 0.03498*sin(conj(q3))^2*sin(conj(q4))*sin(q3)^2*sin(q4) + 0.3208*cos(conj(q3))*cos(conj(q4))*cos(q3)*cos(q4) + 1.964e-17*cos(conj(q3))*cos(conj(q4))*cos(q3)*sin(q4) + 1.964e-17*cos(conj(q3))*cos(conj(q4))*cos(q4)*sin(q3) + 1.964e-17*cos(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) + 1.964e-17*cos(conj(q4))*sin(conj(q3))*cos(q3)*cos(q4) - 0.3208*cos(conj(q3))*cos(conj(q4))*sin(q3)*sin(q4) + 0.3208*cos(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) + 0.3208*cos(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) + 0.3208*cos(conj(q4))*sin(conj(q3))*cos(q3)*sin(q4) + 0.3208*cos(conj(q4))*sin(conj(q3))*cos(q4)*sin(q3) - 0.3208*sin(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) - 1.964e-17*cos(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4) - 1.964e-17*cos(conj(q4))*sin(conj(q3))*sin(q3)*sin(q4) - 1.964e-17*sin(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) - 1.964e-17*sin(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) + 0.3208*sin(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4) + 3.0)^(1/2), -(0.5*(0.187*cos(conj(q3))*cos(q3)*sin(q4) - 1.145e-17*cos(conj(q3))*cos(q3)*cos(q4) + 0.187*cos(conj(q3))*cos(q4)*sin(q3) - 0.187*sin(conj(q3))*cos(q3)*cos(q4) + 1.145e-17*cos(conj(q3))*sin(q3)*sin(q4) + 1.145e-17*sin(conj(q3))*cos(q3)*sin(q4) + 1.145e-17*sin(conj(q3))*cos(q4)*sin(q3) + 0.187*sin(conj(q3))*sin(q3)*sin(q4) - 1.145e-17*cos(conj(q3))*cos(conj(q4))*cos(q3) - 0.187*cos(conj(q3))*cos(conj(q4))*sin(q3) + 0.187*cos(conj(q3))*sin(conj(q4))*cos(q3) + 0.187*cos(conj(q4))*sin(conj(q3))*cos(q3) + 1.145e-17*cos(conj(q3))*sin(conj(q4))*sin(q3) + 1.145e-17*cos(conj(q4))*sin(conj(q3))*sin(q3) + 1.145e-17*sin(conj(q3))*sin(conj(q4))*cos(q3) + 0.187*sin(conj(q3))*sin(conj(q4))*sin(q3) - 0.03498*cos(conj(q3))^2*cos(conj(q4))*cos(q3)^2*sin(q4) - 0.03498*cos(conj(q3))^2*sin(conj(q4))*cos(q3)^2*cos(q4) - 0.03498*cos(conj(q4))*sin(conj(q3))^2*cos(q3)^2*sin(q4) - 0.03498*cos(conj(q3))^2*cos(conj(q4))*sin(q3)^2*sin(q4) - 0.03498*cos(conj(q3))^2*sin(conj(q4))*cos(q4)*sin(q3)^2 - 0.03498*sin(conj(q3))^2*sin(conj(q4))*cos(q3)^2*cos(q4) - 0.03498*cos(conj(q4))*sin(conj(q3))^2*sin(q3)^2*sin(q4) - 0.03498*sin(conj(q3))^2*sin(conj(q4))*cos(q4)*sin(q3)^2 - 3.929e-17*cos(conj(q3))*cos(conj(q4))*cos(q3)*cos(q4) - 9.622e-33*cos(conj(q3))*cos(conj(q4))*cos(q3)*sin(q4) - 9.622e-33*cos(conj(q3))*cos(conj(q4))*cos(q4)*sin(q3) - 9.622e-33*cos(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) - 9.622e-33*cos(conj(q4))*sin(conj(q3))*cos(q3)*cos(q4) + 3.929e-17*cos(conj(q3))*cos(conj(q4))*sin(q3)*sin(q4) + 3.929e-17*cos(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) + 3.929e-17*cos(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) + 3.929e-17*cos(conj(q4))*sin(conj(q3))*cos(q3)*sin(q4) + 3.929e-17*cos(conj(q4))*sin(conj(q3))*cos(q4)*sin(q3) + 3.929e-17*sin(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) + 9.622e-33*cos(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4) + 9.622e-33*cos(conj(q4))*sin(conj(q3))*sin(q3)*sin(q4) + 9.622e-33*sin(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) + 9.622e-33*sin(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) - 3.929e-17*sin(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4)))/(0.4362*cos(conj(q3))*cos(q3) + 2.671e-17*cos(conj(q3))*sin(q3) + 2.671e-17*sin(conj(q3))*cos(q3) + 0.4362*sin(conj(q3))*sin(q3) + 0.187*cos(conj(q3))*cos(q3)*cos(q4) + 1.145e-17*cos(conj(q3))*cos(q3)*sin(q4) + 1.145e-17*cos(conj(q3))*cos(q4)*sin(q3) + 1.145e-17*sin(conj(q3))*cos(q3)*cos(q4) - 0.187*cos(conj(q3))*sin(q3)*sin(q4) + 0.187*sin(conj(q3))*cos(q3)*sin(q4) + 0.187*sin(conj(q3))*cos(q4)*sin(q3) - 1.145e-17*sin(conj(q3))*sin(q3)*sin(q4) + 0.187*cos(conj(q3))*cos(conj(q4))*cos(q3) + 1.145e-17*cos(conj(q3))*cos(conj(q4))*sin(q3) + 1.145e-17*cos(conj(q3))*sin(conj(q4))*cos(q3) + 1.145e-17*cos(conj(q4))*sin(conj(q3))*cos(q3) + 0.187*cos(conj(q3))*sin(conj(q4))*sin(q3) + 0.187*cos(conj(q4))*sin(conj(q3))*sin(q3) - 0.187*sin(conj(q3))*sin(conj(q4))*cos(q3) - 1.145e-17*sin(conj(q3))*sin(conj(q4))*sin(q3) + 0.03498*cos(conj(q3))^2*sin(conj(q4))*cos(q3)^2*sin(q4) + 0.03498*cos(conj(q3))^2*sin(conj(q4))*sin(q3)^2*sin(q4) + 0.03498*sin(conj(q3))^2*sin(conj(q4))*cos(q3)^2*sin(q4) + 0.03498*sin(conj(q3))^2*sin(conj(q4))*sin(q3)^2*sin(q4) + 0.3208*cos(conj(q3))*cos(conj(q4))*cos(q3)*cos(q4) + 1.964e-17*cos(conj(q3))*cos(conj(q4))*cos(q3)*sin(q4) + 1.964e-17*cos(conj(q3))*cos(conj(q4))*cos(q4)*sin(q3) + 1.964e-17*cos(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) + 1.964e-17*cos(conj(q4))*sin(conj(q3))*cos(q3)*cos(q4) - 0.3208*cos(conj(q3))*cos(conj(q4))*sin(q3)*sin(q4) + 0.3208*cos(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) + 0.3208*cos(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) + 0.3208*cos(conj(q4))*sin(conj(q3))*cos(q3)*sin(q4) + 0.3208*cos(conj(q4))*sin(conj(q3))*cos(q4)*sin(q3) - 0.3208*sin(conj(q3))*sin(conj(q4))*cos(q3)*cos(q4) - 1.964e-17*cos(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4) - 1.964e-17*cos(conj(q4))*sin(conj(q3))*sin(q3)*sin(q4) - 1.964e-17*sin(conj(q3))*sin(conj(q4))*cos(q3)*sin(q4) - 1.964e-17*sin(conj(q3))*sin(conj(q4))*cos(q4)*sin(q3) + 0.3208*sin(conj(q3))*sin(conj(q4))*sin(q3)*sin(q4) + 3.0)^(1/2), 0, 0];
dw1=0;
dw2=[ 0, 0, - (10000*q3)/1247689 - 25/2234, - (10000*q4)/1247689 - 25/2234, 1/4 - q5, -(2*q6 + 2*pi)/(128*pi^2)];
dw3=[ (abs(q1 - 23/8)*sign(q1 - 23/8))/(abs(q2 + 3/2)^2 + abs(q1 - 23/8)^2)^(1/2), (abs(q2 + 3/2)*sign(q2 + 3/2))/(abs(q2 + 3/2)^2 + abs(q1 - 23/8)^2)^(1/2), 0, 0, 0, 0];
dw4=[ (abs(q1 - 133/20)*sign(q1 - 133/20))/(abs(q2 + 63/20)^2 + abs(q1 - 133/20)^2)^(1/2), (abs(q2 + 63/20)*sign(q2 + 63/20))/(abs(q2 + 63/20)^2 + abs(q1 - 133/20)^2)^(1/2), 0, 0, 0, 0];
dw5=[ (abs(q1 - 6)*sign(q1 - 6))/(abs(q1 - 6)^2 + abs(q2 - 26/5)^2)^(1/2), (abs(q2 - 26/5)*sign(q2 - 26/5))/(abs(q1 - 6)^2 + abs(q2 - 26/5)^2)^(1/2), 0, 0, 0, 0];
dw6=[ (abs(q1 - 29/5)*sign(q1 - 29/5))/(abs(q2 - 9)^2 + abs(q1 - 29/5)^2)^(1/2), (abs(q2 - 9)*sign(q2 - 9))/(abs(q2 - 9)^2 + abs(q1 - 29/5)^2)^(1/2), 0, 0, 0, 0];
o1=[2.875 -1.5];
o2=[6.65 -3.15];
o3=[6.0 5.2,];
o4=[5.8 9];
ax=[q(1) q(2)];
d1=norm( ax - o1);
d2=norm( ax - o2);
d3=norm( ax - o3);
d4=norm( ax - o4);
a=1+(abs(q3)+abs(q4))^2+abs(0.25-q5)^2+abs(q6)^2;
dist=3;
b=(dist-d1)*heaviside(dist-d1);
c=(dist-d2)*heaviside(dist-d2);
d=(dist-d3)*heaviside(dist-d3);
e=(dist-d4)*heaviside(dist-d4);
dw=dw1+2*a*dw2+b*dw3/d1^2+c*dw4/d2^2+d*dw5/d3^2+e*dw6/d4^2;
% caso rettilineo
%dw=dw1+a/100*dw2+4*b*dw3/d1^2+4*c*dw4/d2^2+4*d*dw5/d3^2+4*e*dw6/d4^2;
q0 = eval(subs(dw));
q0=q0';
q0=[0 0 0 0 0 0]';
end
