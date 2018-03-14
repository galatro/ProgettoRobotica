function [] = ellissoidi(q)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[ J ] = JacobianoGeometrico( q );
Jg=J(1:3,:);
[U,S,V] = svd(Jg*Jg');
[x,y,z] = ellipsoid(0,0,0,sqrt(S(1,1)),sqrt(S(2,2)),sqrt(S(3,3)));
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
title({'Manipolabilità in velocità',strcat('q = [',num2str(q),' ]')})

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
title({'Manipolabilità in forza',strcat('q = [',num2str(q),' ]')})

