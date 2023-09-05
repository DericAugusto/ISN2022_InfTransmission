% Transmission de l'Information TP 2 28/11/2022
% TP Compression : Codage de Huffman

clc; clear all; close all;

% suite de caracteres
M = 'ABRACARABA';

[m, s, p, H] = entropie(M);

[Ma] = arbre(p)

