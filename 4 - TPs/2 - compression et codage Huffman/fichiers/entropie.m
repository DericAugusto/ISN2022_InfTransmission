function [m, s, p, H] = entropie(M)

% information sous forme d'un vecteur d'entiers (criou un array onde cada
% casa representa o valor ASCII de cada letra)
m = double(M);

% caracteres du text
h = hist(m, [0:255]);
s = find(h~=0) - 1;

% vecteur des fréquences d’apparition
P = h(find(h~=0));
p = [];
for i = 1:1:length(P)
    p(i) = P(i)/strlength(M);
end

% entropie de l’information d’entrée
H = 0;
for i = 1:1:length(P)
    H = H - p(i)*log2(p(i));
end

end