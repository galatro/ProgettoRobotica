function [limiti,pos, vel, acc, ostac] = controllo_coppia(tau,q, dq, ddq,t)
limiti_coppia =[300 300 200 200 100];
[a,b]=size(tau);
limiti=zeros(ceil(length(tau)/1000),6);
for i=1:a
    for j=1:b-1
        if abs(tau(i,j))>limiti_coppia(j)
            limiti(ceil(i/1000),j)=limiti(ceil(i/1000),j)+1;
        end
    end
end

o1=[2.875 -1.5];
o2=[6.0 5.2,];

limiti_giunto_inf = [-200 -200 -2.7925  -2.7925 0 -2*pi];   %m m rad rad m rad
limiti_giunto_sup = [ 200  200  2.7925   2.7925 0.5 2*pi]; %m m rad rad m  rad

dqmax       = [  1    1     4       4     0.8   5]; %velocita' massime ai giunti m/s m/s rad/s  rad/s m/s rad/s
ddqmax      = [  3    3    20      20       5  20]; %accelerazioni massime ai giunti m/s^2 m/s^2 rad/s^2 rad/s^2 m/s^2 rad/s^2

t=cumsum(t);


pos=zeros(length(t),6);
vel=zeros(length(t),6);
acc=zeros(length(t),6);

ostac=zeros(2,length(t));
k=1;

for i=1:size(q,1)
    for j=1:size(q,2)
        %pos
        if i>t(k)*1000+1 && k < length(t)
            k=k+1;
        end
        if q(i,j)>limiti_giunto_sup(j) || q(i,j)<limiti_giunto_inf(j)
            pos(k,j)=pos(k,j)+1;
        end
        %vel
        if abs(dq(i,j))>dqmax(j)
            vel(k,j)=vel(k,j)+1;
        end
        %acc
        if abs(ddq(i,j))>ddqmax(j)
            acc(k,j)=acc(k,j)+1;
        end
        %controllo distanza ostacoli
        p=[q(i,1) q(i,2)];
        
        if norm(p-o1) < 1
            ostac(1,k)=ostac(1,k)+1;
        end
        if norm(p-o2) < 1
            ostac(2,k)=ostac(2,k)+1;
        end
    end
end


end

