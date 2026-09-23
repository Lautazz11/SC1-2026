% UNIDAD 2 - EJERCICIO 7:
close all; clear all; clc
pkg load symbolic

% Definición de las funciones.
syms G1 G2 G3 H1 H2 H3 real

% Función de Transferencia del sistema 1.
% a) Trayectorias directas: N1 = 1

% b) Ganacias:
p1 = G1*G2*G3;

% c) Lazos y determinante:
l1 = -G1*H1;
l2 = -G2*H2;
l3 = -G3*H3;

D = 1-(l1+l2+l3)+(l1*l2+l1*l3+l2*l3)-(l1*l2*l3);

% d) Cofactores:
D1 = 1;

% e) Mason:
disp('Función de Transferencia del Sistema 1')
FdTLCs1 = factor(simplify(p1*D1/D),'s')


% Función de Transferencia del sistema 2.
% a) Trayectorias directas: N2 = 1

% b) Ganacias:
p1 = G1*G2*G3;

% c) Lazos y determinante:
l1 = -G1*H1;
l2 = -G2*H2;
l3 = -G3*H3;

D = 1-(l1+l2+l3)+(l1*l3);

% d) Cofactores:
D1 = 1;

% e) Mason:
disp('Función de Transferencia del Sistema 2')
FdTLCs2 = factor(simplify(p1*D1/D),'s')
