function [limiti] = controllo_coppia(tau)
limiti_coppia =[300 300 200 200 100];
[a,b]=size(tau);
limiti=zeros(ceil(length(tau)/500),6);
for i=1:a
    for j=1:b-1
        if abs(tau(i,j))>limiti_coppia(j)
            limiti(ceil(i/500),j)=limiti(ceil(i/500),j)+1;
        end
    end
end
end

