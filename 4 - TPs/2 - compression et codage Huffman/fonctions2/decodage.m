function M = decodage(Mcad,dico)
%M = decodage(Mcad,dico) travers le dictionnaire dico généré par la  
%fonction dictionnaire() et la chaîne de valeurs générée par la fonction 
%encodage(), renvoie la chaîne de caractères initiale, issue du décodage 
%Huffman.

    vec = [];
    M = '';
    for m = 1:1:length(Mcad)
        vec = [vec, Mcad(m)];
        % tester le tableau courant avec toutes les valeurs 
        % du dictionnaire
        for line = 1:1:length(dico)
            if isequal(vec, cell2mat(dico(line,2)) )
                M = append(M, char(dico(line,1)) );
                vec = [];
            end
        end
    end
end

