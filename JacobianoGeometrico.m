function [ Jg ] = JacobianoGeometrico( q )
%JacobianoGeometrico Summary of this function goes here
%   Detailed explanation goes here

[p, phi, R, A] = cindir(q);
zero = [0 0 0]';
Ab1 = A{1}*A{2};
Ab2 = Ab1*A{3};
Ab3 = Ab2*A{4};
Ab4 = Ab3*A{5};
Ab5 = Ab4*A{6};

Jp = [A{1}(1:3,3), Ab1(1:3,3), cross(Ab2(1:3,3), p-Ab2(1:3,4)), cross(Ab3(1:3,3),p-Ab3(1:3,4)), Ab4(1:3,3), cross(Ab5(1:3,3),p-Ab5(1:3,4))];
Jo = [zero, zero, Ab2(1:3,3), Ab3(1:3,3), zero, Ab5(1:3,3)];

Jg = [Jp ; Jo];

end

