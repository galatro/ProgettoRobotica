function ddqDH  = DirectDynamics(tau, qDH, dqDH)
%Input (Column vectors):  
%         tau:  torque (6x1) [N N Nm Nm N Nm]
%          qDH: joint variable in [m, m, rad , rad, m, rad]. 
%         dqDH: joint velocity in [m/s, m/s, rad/s , rad/s, m/s, rad/s]
%         
%Output:  
%         ddqDH: joint acceleration in [m/s^2, m/s^2, rad/s^2 , rad/s^2, m/s^2, rad/s^2]
%InertiaParameters();
ddqDH = Bq(qDH)^-1*(tau-Cqdq(qDH, dqDH)*dqDH-ViscousFriction(dqDH)-Gravity(qDH));
end