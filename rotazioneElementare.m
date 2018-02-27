function R = rotazioneElementare(angle,asse)
if asse == 'x'
    R = [1 0 0,
        0 cos(angle) -sin(angle),
        0 sin(angle) cos(angle)];
else if asse == 'y'
        R=[cos(angle) 0 sin(angle),
              0 1 0, 
             -sin(angle) 0 cos(angle)];
    else
        R = [cos(angle) -sin(angle) 0,
        sin(angle) cos(angle) 0,
        0 0 1];
    end
end

