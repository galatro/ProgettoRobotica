function [xd] = SottoTraiettoria( points, v0, vf, tf )

%p0 = prima colonna points --> viene da cindir (q) dove q è la configurazione attuale dei giunti
%Se points è composta da due vettori colonna, viene pianificata una retta.
%Se points è composta da tre vettori colonna, viene pianificata una
%traiettoria.
%Il primo punto è il punto iniziale, il secondo è il punto finale (nel caso
%della retta) o il punto di via (nel caso della circonferenza).
T = 0.001;
t = [0:T:tf]';
p0 = points (1:3,1);
%calcolo retta
xd = zeros(length(t),3);

if (size(points,2) == 2)
    pf = points (1:3,2);
    l = norm (pf-p0);
    s = spline ([0 tf], [v0 0 l vf], t);
    for i=1:length(t)
        xd (i,:) = p0+(pf-p0)*s(i)/l;
    end
    
%pianifichiamo circonferenza    
else
    pvia = points (1:3,2);
    pf = points (1:3,3);
    %calcolo centro e raggio dati tre punti p0, pf e pvia
    p = [p0, pvia, pf];
    [C, r] = circumference (p);
    %calcolo angolo tetaf tra p0 e pf in senso orario
    a=atan2( (p0(2)-C(2)), p0(1)-C(1));
    if (~isa(a,'double'))
        a = eval(a);
    end
    R=rotazioneElementare(-a,'z');
    Cold=C;
    C=R*C;
    p0=R*p0;
    pf=R*pf;
    b=atan2( (pf(2)-C(2)), pf(1)-C(1));
    
    if (~isa(b,'double'))
        b = eval(b);
    end
    tetaf=b;
    
    if tetaf >= 0
        tetaf = tetaf-2*pi;
    end

    l= r*tetaf;
    s = spline ([0 tf], [v0 0 l vf], t);
    pdp = zeros(length(t),3);
    for i=1:length(t)
        pdp (i,1) = r*cos(s(i)/r);
        pdp (i,2) = r*sin(s(i)/r);
        pdp (i,3) = 0;
    end

    for i=1:length(t)
        xd(i,1:3) = Cold+R\pdp(i,1:3)';
    end
    
end



