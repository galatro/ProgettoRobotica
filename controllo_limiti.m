function [pos, vel, acc, ostac] = controllo_limiti(q, dq, ddq,t)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
o1=[2.875 -1.5];
o2=[6.0 5.2,];

limiti_giunto_inf = [-200 -200 -2.7925  -2.7925 0 -2*pi];   %m m rad rad m rad
limiti_giunto_sup = [ 200  200  2.7925   2.7925 0.5 2*pi]; %m m rad rad m  rad

dqmax       = [  1    1     4       4     0.8   5]; %velocita' massime ai giunti m/s m/s rad/s  rad/s m/s rad/s
ddqmax      = [  3    3    20      20       5  20]; %accelerazioni massime ai giunti m/s^2 m/s^2 rad/s^2 rad/s^2 m/s^2 rad/s^2

t=cumsum(t);

[a,b,c]=size(q);

pos=zeros(length(t),6);
vel=zeros(length(t),6);
acc=zeros(length(t),6);

ostac=zeros(1,2);
k=1;

for i=1:c
    for j=1:a
        %pos
        if i>t(k)*1000+1 && k < length(t)
            k=k+1;
        end
        if q(j,1,i)>limiti_giunto_sup(j) || q(j,1,i)<limiti_giunto_inf(j)
            pos(k,j)=pos(k,j)+1;
        end
        %vel
        if abs(dq(j,1,i))>dqmax(j)
            vel(k,j)=vel(k,j)+1;
        end
        %acc
        if abs(ddq(j,1,i))>ddqmax(j)
            acc(k,j)=acc(k,j)+1;
            if j==5 && k==6
                ddq(j,1,i)
            end
        end
        %controllo distanza ostacoli
        p=[q(1,1,i) q(2,1,i)];
        
        if norm(p-o1) < 1
            ostac(1)=ostac(1)+1;
        end
        if norm(p-o2) < 1
            ostac(2)=ostac(2)+1;
        end
    end
end
end

