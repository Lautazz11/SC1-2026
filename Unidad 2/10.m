% UNIDAD 2 - EJERCICIO 10
close all; clear all; clc

% 1. Definimos constantes
syms G1 G2 G3 G4 H1 H2 H3 real

% 2. Y5/Y1
% 2.1 Parametros de Mason
% Trayectorias directas
M1 = G1 * G2 * G3;
M2 = G4 * G3;

% Lazos
l1 = -G1 * H1;
l2 = -G3 * H2;
l3 = -G1 * G2 * G3 * H3;
l4 = -G4 * G3 * H3;

% Determinante
det = 1 - (l1 + l2 + l3 + l4) + (l1*l2);

% Determinante de la trayectoria 1 y 2 (los lazos que comparten nodos con el det desaparecen)
det1 = 1;
det2 = 1;

% 2.2 FdT por Algoritmo de Mason:
Y5_Y1 = (M1 * det1 + M2 * det2) / det

% 3. Y3/Y1
% 3.1 Parametros de Mason
% Trayectorias directas
M1 = G1 * G2 * G3;

% Lazos
l1 = -G1 * H1;
l2 = -G3 * H2;
l3 = -G1 * G2 * G3 * H3;
l4 = -G4 * G3 * H3;

% Determinante
det = 1 - (l1 + l2 + l3 + l4) + (l1*l2);

% Determinante de la trayectoria 1 (los lazos que comparten nodos con el det desaparecen)
det1v = 1 - (l2);

% 3.2 FdT por Algoritmo de Mason:
Y3_Y1 = M1 * det1v / det

