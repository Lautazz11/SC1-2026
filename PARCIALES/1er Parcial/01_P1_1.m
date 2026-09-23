% 1ER PARCIAL - 1 (16/09/24): EJERCICIO 1
close all; clear all; clc
pkg load symbolic

% 1. Declaro las variables
syms G1 G2 G3 G4 G5 G6 s real
syms H2 H4 H6 real

% 2. Resolucion por Mason
% a) Trayectorias directas: N=2

% b) Ganancias:
P1 = G1*G2*G3*G4*G5;
P2 = G1*G2*G6;

% c) Lazos y determinante:
L1 = -G6*H6;
L2 = -G2*H2;
L3 = -G1*G2*G3*G4*H4;

D = 1 - (L1+L2+L3) + (L1*L2 + L1*L3)

% d) Cofactores:
d1 = 1 - L1
d2 = 1

% e) Regla de Mason:
Y_R = (P1*d1 + P2*d2) / D

% Uso el factor para agrupar terminos
FdT = factor(Y_R)

