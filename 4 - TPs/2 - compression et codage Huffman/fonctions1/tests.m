

j=1;
    n = length(symboles(M));
    for i=1:length(HISTOGRAMME)
        if HISTOGRAMME(i)~=0
            V(j)=HISTOGRAMME(i);
            j = j+1;
        end
    end
   
    Maintermediare = zeros(2*n-1,2*n-1);

       %%ALGORITHME

    for i=1:n-1
        [VS,IS]=sort(V) % je regarde les deux plus petites proba d'appartion dans VS 
        Maintermediare(IS(1),n+i)=1; % je rempli Maintermediaire, arc des deux symboles associes vers leur concat
        Maintermediare(IS(2),n+i)=1;
        nomsintermediaire(IS(1))=1; %feuille la plus petite prends 1
        nomsintermediaire(IS(2))=0; %feuille la deuxieme plus petite prends 0
        V(n+i)=V(IS(1))+V(IS(2)); % je somme leur proba  PUIS j'ajoute a VS la somme des deux 
        V(IS(1))=2; % je remplace les deux probas par 2 pour ne plus avoir a les trie 
        V(IS(2))=2;
 
    end
    Ma = Maintermediare;
    Noms = nomsintermediaire;
  