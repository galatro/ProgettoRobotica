function tau = n(u)
%Input (Column vectors):   
%         qDH:   joint variable in [m, m, rad , rad, m, rad]. 
%         dqDH:  joint velocity in [m/s, m/s, rad/s , rad/s, m/s, rad/s]
%         ddqDH: joint acceleration in [m/s^2, m/s^2, rad/s^2 , rad/s^2, m/s^2, rad/s^2]


qDH(:, 1) = u(1:6);
dqDH(:, 1) = u(7:12);

tau = Cqdq(qDH, dqDH)*dqDH+ViscousFriction(dqDH)+Gravity(qDH);

end

