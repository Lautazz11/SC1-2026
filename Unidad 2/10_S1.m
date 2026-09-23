% UNIDAD 2 - EJERCICIO 10, SISTEMA 1:
close all; clear all; clc
pkg load symbolic

% Defino las variables
syms G1 G2 G3 G4 H1 H2 H3 real

% a) Trayectorias directas: N=2

% b) Ganancias:
M1 = G1*G2*G3;
M2 = G3*G4;

% c) Lazos y determinante:
l1 = -G1*H1;
l2 = -G3*H2;
l3 = -G1*G2*G3*H3;
l4 = -G3*G4*H3;

D = 1-(l1+l2+l3+l4)+(l1*l2);

% d) Cofactores:
D1 = 1;
D2 = 1;

% e) Mason:
Y5_Y1 =( M1*D1+M2*D2)/D
