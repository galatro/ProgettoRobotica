
limiti_coppia =[300 300 200 200 100];


%%%%%%%%%%%%%%%%%%%LIMITI FISICI DEL MANIPOLATORE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
limiti_giunto_inf = [-200 -200 -2.7925  -2.7925 0 -2*pi];   %m m rad rad m rad
limiti_giunto_sup = [ 200  200  2.7925   2.7925 0.5 2*pi]; %m m rad rad m  rad
dqmax        = [  1    1     4       4     0.8 5]; %velocita' massime ai giunti m/s m/s rad/s  rad/s m/s rad/s
ddqmax      = [  3    3    20        20   5  20]; %accelerazioni massime ai giunti m/s^2 m/s^2 rad/s^2 rad/s^2 m/s^2 rad/s^2
