function Mcad = encodage(M,dico)
%Mcad = encodage(M,dico) à travers le dictionnaire dico généré par la 
%fonction dictionnaire() et la chaîne de caractères M analysée, effectue  
%un encodage Huffman.
    Mcad = [];
    for m = 1:1:length(M)
    for i = 1:1:length(dico)
        if char(dico(i,1)) == M(m)
            Mcad = [Mcad, cell2mat(dico(i,2))];
            continue
        end
    end
    end
end

