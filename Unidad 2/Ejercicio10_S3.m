% UNIDAD 2 - EJERCICIO 10, SISTEMA 3:
close all; clear all; clc
pkg load symbolic

% Defino las variables
S = TF('s');

% a) Trayectorias directas: N=2

% b) Ganancias:
M1 = 10*1/s*1/s*1;
M2 = 10*5;

% c) Lazos y determinante:
l1 = -5/s;
l2 = -1*1/s*1/s;
l3 = -10*s*1/s*1;
l4 = -5;
l5 = 5*1*(-10*s)*(-5);

D = 1-(l1+l2+l3+l4+l5);

% d) Cofactores:
D1 = 1;
D2 = 1;

% e) Mason:
Y5_Y1 = minreal((M1*D1+M2*D2)/D)

disp('Terminado')
