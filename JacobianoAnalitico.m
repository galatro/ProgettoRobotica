function [ Ja ] = JacobianoAnalitico( q , eul)
%JACOBIANOANALITICO Summary of this function goes here
%   Detailed explanation goes here

[p, phi, R, A] = cindir(q);
Jg  = JacobianoGeometrico( q );
%R default rpy (zyx)
if eul == 'RPY'
    Ta=[0 0 1;0 1 0 ;1 0 0 ];
else
    disp('Bisogna usare RPY');
    Ta=[0 0 1;0 1 0 ;1 0 0 ];
end
Ja=[Jg(1:3,1:6); Ta\Jg(4:6,1:6)];


end

