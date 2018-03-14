function [ q0 ] = q0p( q )
%Q0P Summary of this function goes here
%   Detailed explanation goes here
q1=q(1);
q2=q(2);
q3=q(3);
q4=q(4);
q5=q(5);
q6=q(6);
dw1=[ 0, 0, -(0.5*(0.04128*sin(q3)+0.04128*sin(q3)+0.07081*cos(q3)*sin(q4)+0.07081*cos(q4)*sin(q3)-0.001704*cos(q3)*sin(q3)-0.001704*sin(q3)*cos(q3)+0.07081*cos(q3)*sin(q4)+0.07081*cos(q4)*sin(q3)+0.007721*cos(q3)^2*sin(q4)*cos(q3)+0.007721*sin(q3)^2*sin(q4)*cos(q3)+0.007721*cos(q3)*cos(q3)^2*sin(q4)+0.007721*cos(q3)*sin(q3)^2*sin(q4)))/(0.04128*cos(q3)+0.04128*cos(q3)+0.07081*cos(q3)*cos(q4)-0.07081*sin(q3)*sin(q4)+0.4362*cos(q3)*cos(q3)+0.4379*sin(q3)*sin(q3)+0.07081*cos(q3)*cos(q4)-0.07081*sin(q3)*sin(q4)-0.007721*cos(q3)^2*sin(q4)*sin(q3)-0.007721*sin(q3)^2*sin(q4)*sin(q3)+0.187*cos(q3)*cos(q3)*cos(q4)-0.187*cos(q3)*sin(q3)*sin(q4)+0.187*sin(q3)*cos(q3)*sin(q4)+0.187*sin(q3)*cos(q4)*sin(q3)+0.187*cos(q3)*cos(q4)*cos(q3)-0.007721*sin(q3)*cos(q3)^2*sin(q4)+0.187*cos(q3)*sin(q4)*sin(q3)+0.187*cos(q4)*sin(q3)*sin(q3)-0.187*sin(q3)*sin(q4)*cos(q3)-0.007721*sin(q3)*sin(q3)^2*sin(q4)+0.03498*cos(q3)^2*sin(q4)*cos(q3)^2*sin(q4)+0.03498*cos(q3)^2*sin(q4)*sin(q3)^2*sin(q4)+0.03498*sin(q3)^2*sin(q4)*cos(q3)^2*sin(q4)+0.03498*sin(q3)^2*sin(q4)*sin(q3)^2*sin(q4)+0.3208*cos(q3)*cos(q4)*cos(q3)*cos(q4)-0.3208*cos(q3)*cos(q4)*sin(q3)*sin(q4)+0.3208*cos(q3)*sin(q4)*cos(q3)*sin(q4)+0.3208*cos(q3)*sin(q4)*cos(q4)*sin(q3)+0.3208*cos(q4)*sin(q3)*cos(q3)*sin(q4)+0.3208*cos(q4)*sin(q3)*cos(q4)*sin(q3)-0.3208*sin(q3)*sin(q4)*cos(q3)*cos(q4)+0.3208*sin(q3)*sin(q4)*sin(q3)*sin(q4)+3.016)^(1/2), -(0.5*(0.07081*cos(q3)*sin(q4)+0.07081*cos(q4)*sin(q3)+0.07081*cos(q3)*sin(q4)+0.07081*cos(q4)*sin(q3)+0.007721*cos(q3)^2*cos(q4)*sin(q3)+0.007721*cos(q4)*sin(q3)^2*sin(q3)+0.187*cos(q3)*cos(q3)*sin(q4)+0.187*cos(q3)*cos(q4)*sin(q3)-0.187*sin(q3)*cos(q3)*cos(q4)+0.187*sin(q3)*sin(q3)*sin(q4)+0.007721*sin(q3)*cos(q3)^2*cos(q4)-0.187*cos(q3)*cos(q4)*sin(q3)+0.187*cos(q3)*sin(q4)*cos(q3)+0.187*cos(q4)*sin(q3)*cos(q3)+0.007721*sin(q3)*cos(q4)*sin(q3)^2+0.187*sin(q3)*sin(q4)*sin(q3)-0.03498*cos(q3)^2*cos(q4)*cos(q3)^2*sin(q4)-0.03498*cos(q3)^2*sin(q4)*cos(q3)^2*cos(q4)-0.03498*cos(q4)*sin(q3)^2*cos(q3)^2*sin(q4)-0.03498*cos(q3)^2*cos(q4)*sin(q3)^2*sin(q4)-0.03498*cos(q3)^2*sin(q4)*cos(q4)*sin(q3)^2-0.03498*sin(q3)^2*sin(q4)*cos(q3)^2*cos(q4)-0.03498*cos(q4)*sin(q3)^2*sin(q3)^2*sin(q4)-0.03498*sin(q3)^2*sin(q4)*cos(q4)*sin(q3)^2))/(0.04128*cos(q3)+0.04128*cos(q3)+0.07081*cos(q3)*cos(q4)-0.07081*sin(q3)*sin(q4)+0.4362*cos(q3)*cos(q3)+0.4379*sin(q3)*sin(q3)+0.07081*cos(q3)*cos(q4)-0.07081*sin(q3)*sin(q4)-0.007721*cos(q3)^2*sin(q4)*sin(q3)-0.007721*sin(q3)^2*sin(q4)*sin(q3)+0.187*cos(q3)*cos(q3)*cos(q4)-0.187*cos(q3)*sin(q3)*sin(q4)+0.187*sin(q3)*cos(q3)*sin(q4)+0.187*sin(q3)*cos(q4)*sin(q3)+0.187*cos(q3)*cos(q4)*cos(q3)-0.007721*sin(q3)*cos(q3)^2*sin(q4)+0.187*cos(q3)*sin(q4)*sin(q3)+0.187*cos(q4)*sin(q3)*sin(q3)-0.187*sin(q3)*sin(q4)*cos(q3)-0.007721*sin(q3)*sin(q3)^2*sin(q4)+0.03498*cos(q3)^2*sin(q4)*cos(q3)^2*sin(q4)+0.03498*cos(q3)^2*sin(q4)*sin(q3)^2*sin(q4)+0.03498*sin(q3)^2*sin(q4)*cos(q3)^2*sin(q4)+0.03498*sin(q3)^2*sin(q4)*sin(q3)^2*sin(q4)+0.3208*cos(q3)*cos(q4)*cos(q3)*cos(q4)-0.3208*cos(q3)*cos(q4)*sin(q3)*sin(q4)+0.3208*cos(q3)*sin(q4)*cos(q3)*sin(q4)+0.3208*cos(q3)*sin(q4)*cos(q4)*sin(q3)+0.3208*cos(q4)*sin(q3)*cos(q3)*sin(q4)+0.3208*cos(q4)*sin(q3)*cos(q4)*sin(q3)-0.3208*sin(q3)*sin(q4)*cos(q3)*cos(q4)+0.3208*sin(q3)*sin(q4)*sin(q3)*sin(q4)+3.016)^(1/2), 0, 0];
%dw1=0;
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
dw=dw1+2*a*abs(dw2)+3*b*dw3/d1^2+c*dw4/d2^2+3*d*dw5/d3^2+e*dw6/d4^2;
% caso rettilineo
global rect
if rect
    dw=dw1+a/100*dw2+4*b*dw3/d1^2+2*c*dw4/d2^2+4*d*dw5/d3^2+2*e*dw6/d4^2;
end
q0 = eval(subs(dw));
q0=q0';
end
