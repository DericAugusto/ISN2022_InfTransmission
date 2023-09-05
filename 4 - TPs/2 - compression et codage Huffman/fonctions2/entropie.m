function [H , p, s] = entropie(M)
%[H , p, s] = entropie(M) calcule à partir d'une chaîne de caractères 
% son entropie H, le vecteur s qui est une liste des caractères de M  
%dans l'ordre où ils apparaissent, et le vecteur p, qui est la 
%probabilité d'apparition de chaque caractère de s dans M.

    lengM = strlength(M);
    
    % génère le vecteur s qui contient les variables de M 
    % répétées une seule fois
    s = '';
    for i = 1:1:lengM
        if ~contains(s, M(i))
            s = strcat(s, M(i));
        end
    end

    % génère le vecteur p avec les probabilités 
    % des caractères de s dans M
    lengS = strlength(s);
    p = zeros(1,lengS);
    for i = 1:1:lengS
        p(i) = count(M,s(i))/lengM;
    end
    
    % calcule l'entropie H à partir du vecteur p
    H = 0;
    for i = 1:1:lengS
        pi = p(i);
        H = H - log2(pi)*pi;  
    end
end
