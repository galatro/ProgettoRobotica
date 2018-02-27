function [] = ellissoidi(q)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
q3=q(3);
q4=q(4);
Jg=[    1,  0,  -0.467*sin(q3)-0.4005*sin(q4)*cos(q3)-0.4005*cos(q4)*sin(q3),   -0.4005*cos(q4)*sin(q3)-0.4005*sin(q4)*cos(q3), 0,  0;
        0,  1,  0.467*cos(q3)-0.4005*sin(q4)*sin(q3)+0.4005*cos(q4)*cos(q3),    -0.4005*sin(q4)*sin(q3)+0.4005*cos(q4)*cos(q3), 0,  0;
        0,  0,  0,  0,  -1,  0];
%        0,  0,  1,  1,   0,  1];
[U,S,V] = svd(Jg*Jg');
[x,y,z] = ellipsoid(0,0,0,sqrt(S(1,1)),sqrt(S(2,2)),sqrt(S(3,3)));
for i=1:length(x)
    temp=U*[x(i,:); y(i,:); z(i,:)];
    vx(i,:)=temp(1,:);
    vy(i,:)=temp(2,:);
    vz(i,:)=temp(3,:);
end
surf(vx,vy,vz)
xlabel('X')
ylabel('Y')
zlabel('Z')
daspect([1 1 1])
title('Manipolabilità in velocità')

[x,y,z] = ellipsoid(0,0,0,1/sqrt(S(1,1)),1/sqrt(S(2,2)),1/sqrt(S(3,3)));
for i=1:length(x)
    temp=U*[x(i,:); y(i,:); z(i,:)];
    vx(i,:)=temp(1,:);
    vy(i,:)=temp(2,:);
    vz(i,:)=temp(3,:);
end
figure
surf(vx,vy,vz)
xlabel('X')
ylabel('Y')
zlabel('Z')
daspect([1 1 1])
title('Manipolabilità in forza')

