function [s] = symboles(M)
%cette fonction renvoie les symboles d'un message.
%le message est transforme en un tableau qui contient 1 a la ieme colonne
% si le symbole au code ASCII i est present dans le symbole.
    Pi = histogramme(M);
    i = 1;
    j = 1;
     
    while i<=length(Pi)
        if Pi(i)==0
            i=i+1;%on passe a un nouveau caractere car pas le caractere
        else
            s(j) = char(i-1);%on transforme ASCII vers caractere
            j=j+1;
            i=i+1;
        end
    end
    
end

