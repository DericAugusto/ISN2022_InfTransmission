function dico = dictionnaire(Ma, noms, s)
%dico = dictionnaire(Ma, noms, s) reçoit la matrice de connexion Ma et le 
%vecteur noms générés par la fonction arbre(p), plus le vecteur s, généré 
%par la fonction entropie(M), et retourne un dictionnaire dic, où les clés
%sont les caractères de s contenus dans la colonne 1 et les valeurs sont 
%les listes se référant aux caractères de s contenus dans la colonne 2. 
%Les valeurs se référant aux caractères indiquent l'ordre des valeurs 
%binaires des noms dans l'arbre Ma.

    dico = {};
    % suit les lignes Ma en se référant au s
    for i = 1:1:length(s)
        % ajouter l'élément noms correspondant à la lettre
        value = [noms(i)];
        % ajouter dans la liste de valeurs toutes les valeurs noms
        % correspondant aux liens du caractère analysé
        index = find(Ma(i, :) == 1);
        while index ~= length(Ma)
            value = [noms(index), value];
            index = find(Ma(index, :) == 1);
        end
        % création du dictionnaire
        dico{i,1} = s(i);
        dico{i,2} = value;
    end
end

