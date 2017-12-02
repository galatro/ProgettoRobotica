syms q1 q2 q3 q4 q5 q6;
qsym=[q1 q2 q3 q4 q5 q6];
%condizione di 
w1 = 0;
n = 6 ;
qim = [-200 -200 -2.7925  -2.7925 0 -2*pi];   %m m rad rad m rad
qiM = [ 200  200  2.7925   2.7925 0.5 2*pi]; %m m rad rad m  rad
w2 = 0;
for i=3:6
    w2 = w2+((qsym(i)-(qim(i)+qiM(i)/2))/(qiM(i)-qim(i)))^2;
end

w2 = -(1/8)*w2;

o1=[2.875 -1.5];
o2=[6.65 -3.15];
p=[q1 q2];
w3=norm(p-o1);
w4=norm(p-o2);
dw1 = jacobian(w1,qsym);
dw2 = jacobian(w2,qsym);
dw3 = jacobian(w3,qsym);
dw4 = jacobian(w4,qsym);