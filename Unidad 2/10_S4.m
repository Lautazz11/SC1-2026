% UNIDAD 2 - EJERCICIO 10, SISTEMA 4:
close all; clear all; clc
pkg load symbolic

% Defino las variables
s = tf('s');

% a) Trayectorias directas: N1=2 , N2=2, N3=1

% b) Lazos y determinante:
l1 = -1/s;
l2 = -1/s;
l3 = -5*s * 30 * 1/s * 1/s;
l4 = -5*s * 30 * 5;
l5 = 5;

Det = 1 - (l1 + l2 + l3 + l4 + l5);

% c) Ganancias y cofactores:
%% FdT Y5/Y1;
M1 = 1/s * 1/s * 30;
M2 = 5 * 30;

D1 = 1;
D2 = 1;

Y5_Y1 = minreal((M1 * D1 + M2 * D2) / Det);

%% FdT Y4/Y1
M1 = 1/s * 1/s;
M2 = 5;

D1 = 1;
D2 = 1;

Y4_Y1 = minreal((M1 * D1 + M2 * D2) / Det);

%% FdT Y2 / Y1
M1 = 1;

D1 = 1 - l2;

Y2_Y1 = minreal((M1 * D1) / Det);

disp('Terminado')
