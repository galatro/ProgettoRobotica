function g = Gravity(qDH)
%Input:   qDH: joint variable in [m, m, rad , rad, m, rad]
%Output:  g: gravity torque (6x1) [N N Nm Nm N Nm]
InertiaParameters();
g = zeros(6,1);
g(5) = -ml3*9.81;

end