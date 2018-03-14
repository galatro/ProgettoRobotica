function tau = InverseDynamics(qDH, dqDH, ddqDH)
%Input (Column vectors):   
%         qDH:   joint variable in [m, m, rad , rad, m, rad]. 
%         dqDH:  joint velocity in [m/s, m/s, rad/s , rad/s, m/s, rad/s]
%         ddqDH: joint acceleration in [m/s^2, m/s^2, rad/s^2 , rad/s^2, m/s^2, rad/s^2]

tau = Bq(qDH)*ddqDH+Cqdq(qDH, dqDH)*dqDH+ViscousFriction(dqDH)+Gravity(qDH);


end