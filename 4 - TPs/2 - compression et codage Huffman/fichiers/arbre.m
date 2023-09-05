function [Ma] = arbre(p)
    
    % initialise une matrice NxN. N est le nombre de symboles
    N = 2*length(p)-1;
    Ma = zeros(N, N);
    probabilite = 0;
    [ps, is] = sort(p); % mettre des valeurs de probabilite en ordre croissante
    pk = []; % création d’un nouveau sommet
    i = 1;
    while probabilite < 1
        % calcule la somme des deux mineurs probabilites
        pk(is(i)+is(i+1)) = ps(i) + ps(i+1);
        % atualiza o valor da probabilidade global
        probabilite = probabilite + pk(is(i)+is(i+1));
        % remplie la matrice Ma avec 1 dans les bonnes endroits
        Ma(is(i), is(i)+is(i+1)) = 1;
        Ma(is(i+1), is(i)+is(i+1)) = 1;

        
        % remplace les valeurs de la plus petite probabilité par zéro
        ps(i) = 0;
        ps(i+1) = 0;
        % réduit la matrice de probabilité en supprimant les valeurs nulles
        ps = sparse(ps);
        % ajoute la probabilité du lien effectué dans le tableau de probabilité
        ps = [ps, ps(i) + ps(i+1)];
        % encore une fois, met les probabilités dans l'ordre croissant
        [ps, is] = sort(ps);   
    end

end