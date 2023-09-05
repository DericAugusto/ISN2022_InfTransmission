function [H,s,entrop] = entropie(message)
%cette fonction renvoie, l'histogramme, les symboles et l'entropie 
    H = histogramme(message);
    s = symboles(message);
    entropint = 0;
    i = 1;
    while i<=length(H)
        if H(i)==0
            i=i+1;
        else
            entropint = entropint + -log2(H(i))*H(i);
            i = i+1;
        end
    end
    entrop = entropint;
end

