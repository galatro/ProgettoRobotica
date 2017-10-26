function B = Bq(qDH)
%Input:   qDH: joint variable in [m, m, rad , rad, m, rad]
%Output:  B: inertia matrix (6x6)
c4 = cos(qDH(4));
InertiaParameters();
B(1,1) = m;
B(2,2) = m;
B(3,3) = Il1 + ml1*l1^2+Il2+ml2*(a1^2+l2^2+2*a1*l2*c4);
B(3,4) = Il2+ml2*(l2^2+a1*l2*c4);
B(4,3) = B(3,4);
B(4,4) = Il2+ml2*l2^2;
B(5,5) = ml3;
B(6,6) = Il4;

end