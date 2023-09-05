function [Ma, noms] = arbre(p)
%[Ma, noms] = arbre(p) à partir d'un vecteur de probabilité p, calcule  
%la matrice Ma représentant l'arbre généré par le codage de Huffman 
%(matrice carrée où les chiffres 1 indiquent les liens entre les nœuds) 
%et le vecteur noms. Le vecteur noms représente une chaîne binaire qui 
%indique l'ordre des liens établis dans la matrice Ma. Lorsque l'on 
%connecte deux nœuds, l'un d'eux reçoit le numéro 1 et l'autre le numéro 0.
%Les numéros, à leur tour, sont ajoutés dans l'ordre de leur connexion au 
%vecteur noms.

    % découvrir le nombre d'éléments
    lengthP = length(p);
    % création de la matrice d'arbre vide Ma
    Ma = zeros(2*lengthP-1);
    % création d'un vecteur noms vide
    noms = zeros(1,2*lengthP-2);
    % générer un vecteur de probabilités des nœuds de la matrice Ma
    probs = [p,ones(1,(lengthP-1))];

    % itération pour chaque nœud qui sera créé
    for i = (lengthP+1):1:(2*lengthP-1)
        % trouver les plus petites probabilités
        [ps, is] = sort(probs);
        % en attribuant dans la matrice Ma la valeur 1 pour les deux 
        % les plus petites probabilités
        Ma(is(1),i) = 1;
        Ma(is(2),i) = 1;
        % remplissage du vecteur noms
        noms(is(1)) = 0;
        noms(is(2)) = 1;
        % fixer la probabilité sur le nouveau nœud créé
        % (somme des deux noeuds précédents)
        probs(i) = probs(is(1)) + probs(is(2));
        % en rejetant les probabilités utilisées
        probs(is(1)) = 1;
        probs(is(2)) = 1;
    end
end

