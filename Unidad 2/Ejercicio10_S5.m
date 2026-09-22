% UNIDAD 2 - EJERCICIO 10, SISTEMA 5:
close all; clear all; clc
pkg load control;

% Defino las variables
s = tf('s');

% a) Trayectorias directas: N1=2 , N2=1, N3=1

% b) Lazos y determinante:
l1 = -1/s;
l2 = -30;
l3 = -10;
l4 = -5 * 1/s;
l5 = -1/s * 1/s * 30;

Det = 1 - (l1 + l2 + l3 + l4 + l5)
        + (l1*l3 + l1*l4 + l2*l3 * l3*l5);

% c) Ganancias y cofactores:
%% FdT Y5/Y1;
M1 = 1/s * 1/s * 30;
M2 = 5 * 1/s;

D1 = 1 - l3;
D2 = 1 - l1;

Y5_Y1 = minreal((M1 * D1 + M2 * D2) / Det)

%% FdT Y4/Y1
M1 = 1/s * 1/s;

D1 = 1 - l3;

Y4_Y1 = minreal((M1 * D1) / Det)

%% FdT Y2 / Y1
M1 = 1;

D1 = 1 - (l1+l2+l3);

Y2_Y1 = minreal((M1 * D1) / Det)

disp('Terminado')
