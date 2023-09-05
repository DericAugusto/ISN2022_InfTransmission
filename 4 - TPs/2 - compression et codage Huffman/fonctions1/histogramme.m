function [histo] = histogramme(M)
%cette fonction renvoie la probablite de chaque caracatere dans un message
    M = M(:); %split
    M = uint8(M); %char2int... Cela permet de generaliser le code
    h = hist(M,0:255);
    histo = h/length(M);%Probabilite associe a chaque caracter
end

