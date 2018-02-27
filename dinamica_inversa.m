function [ output_args ] = dinamica_inversa( input_args )
%DINAMICA_INVERSA Summary of this function goes here
%   Detailed explanation goes here

T = 0.001;

%valori provenienti dall'inversione cinematica
for i=1:size(q,3)
temp(1:6)=q(1:6,1,i);
qd(i,1:6)=temp';
end

for i=1:size(dq,3)
temp(1:6)=dq(1:6,1,i);
dqd(i,1:6)=temp';
end

ddqd = ddq;

%Kp e Kd determinano velocità di convergenza dell'errore
%scelta di Kp e Kd è fatta in relazione ai coefficienti w_n e zita
w_n = [100 100 100 100 100 100]; 
zita = [0.8 0.8 0.8 0.8 0.8 0.8];
Kp = diag([(w_n(1))^2 (w_n(2))^2 (w_n(3))^2 (w_n(4))^2 (w_n(5))^2 (w_n(6))^2]);
Kd = diag([2*zita(1)*w_n(1) 2*zita(2)*w_n(2) 2*zita(3)*w_n(3) 2*zita(4)*w_n(4) 2*zita(5)*w_n(5) 2*zita(6)*w_n(6)]);

%tempi simulazione
tf = 31.319;
tfsim = tf+0.01;
t = (0:T:tf)';

end

