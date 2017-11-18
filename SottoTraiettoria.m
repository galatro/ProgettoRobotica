function [ xd, dxd, ddxd ] = SottoTraiettoria( points, v0, vf, tf )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%p0 = prima colonna points --> viene da cindir (q) dove q è la configurazione attuale dei giunti

%se non c'è punto di via pianifichiamo retta
T = 0.001;
t = [0:T:tf]';
p0 = points (1:3,1);
if (size(points,2) == 2)
    pf = points (1:3,2);
    l = norm (pf-p0);
    s = spline ([0 tf], [v0 0 l vf], t);
    
    for i=1:length(t)
        pd (i,:) = p0+(pf-p0)*s(i)/l;
    end
%pianifichiamo circonferenza    
else
    pvia = points (1:3,2);
    pf = points (1:3,3);
    %calcolo centro e raggio dati tre punti p0, pf e pvia
    p = [p0, pvia, pf];
    [C, r] = circumference (p);
    C=single(C);
    r=single(r);
    
    %calcolo angolo tetaf tra p0 e pf in senso orario
    a=atan2(p0(2)-C(2),p0(1)-C(1));
    b=atan2(pf(2)-C(2),pf(1)-C(1));
    tetaf=a-b; 
    if tetaf <= 0
        tetaf = tetaf+2*pi;
    end
    l= r*tetaf;
    s = spline ([0 tf], [v0 0 l vf], t);
    for i=1:length(t)
        pdp (i,1) = r*cos(s(i)/r);
        pdp (i,2) = r*sin(s(i)/r);
        pdp (i,3) = 0;
    end
    
    p0b = p0-C;
    angle = atan2(p0b(2),p0b(1));
    if (p0b(2)<0)
        angle = angle + 2*pi;
    end
    R = rotazioneElementare (atan2(p0b(2),p0b(1)) , 'z');
    for i=1:length(t)
        pd(i,1:3) = C+R*pdp(i,1:3)';
    end
    plot(pd(:,1),pd(:,2))
    xd = 0;
    dxd = 0;
    ddxd= 0;
    %calcolo 
end
end


