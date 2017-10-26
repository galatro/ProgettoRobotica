function Cqdq = Cqdq(qDH, dqDH)
%Input:   qDH:   joint position in [m, m, rad , rad, m, rad]
%         dqDH:  joint velocity in [m/s, m/s, rad/s , rad/s, m/s, rad/s]
%Output:  C(q,dq): coriolis and centrifugal matrix

c4 = cos(qDH(4));
s4 = cos(qDH(4));
InertiaParameters();
h = -ml2*a1*l2*s4;
Cqdq(1,1) = 0;
Cqdq(2,2) = 0;
Cqdq(3,3) = h*dqDH(4);
Cqdq(3,4) = h*(dqDH(3)+dqDH(4));
Cqdq(4,3) = -h*dqDH(3);
Cqdq(4,4) = 0;
Cqdq(5,5) = 0;
Cqdq(6,6) = 0;




end