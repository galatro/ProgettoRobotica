function friction = ViscousFriction( dqDH )
%Input (Column vectors):  
%         dqDH: joint acceleration in [m/s, m/s, rad/s , rad/s, m/s, rad/s]

friction = [   25.4885*dqDH(1)
               25.4885*dqDH(2)
               8.4885*dqDH(3)
               8.1106*dqDH(4)
               2.3273*dqDH(5)
               1.77025*dqDH(6)];
end