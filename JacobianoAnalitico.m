function [ Ja ] = JacobianoAnalitico( q , eul)
%JACOBIANOANALITICO Summary of this function goes here
%   Detailed explanation goes here

[p, phi, R, A] = cindir(q);
Jg  = JacobianoGeometrico( q );
%R default rpy (zyx)
if eul == 'ZYZ'
    Ta=[0 -sin(phi(1)) cos(phi(1))*sin(phi(2)); 0 cos(phi(1)) sin(phi(1))*sin(phi(2)) ; 1 0 cos(phi(2))];
else
    Ta=[0 0 1;0 1 0 ;1 0 0 ];
end
Ja=[Jg(1:3,1:6); inv(Ta)*Jg(4:6,1:6)];


end

