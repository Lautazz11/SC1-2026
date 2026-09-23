% UNIDAD 2 - EJERCICIO 6:
pkg load symbolic
close all; clear all; clc

% Definición de las funciones.
syms G H real

% Sistema 1.
% a) Trayectorias directas: N1 = 1

% b) Ganancias:
M1 = G;

% c) Lazos y determinante:
l1 = -G*H;

D = 1-l1;

% d) Cofactores:
D1 = 1;

% e) Mason:
FdTS1 = M1*D1/D


% Sistema 2.
% a) Trayectorias directas: N2 = 1

% b) Ganancias:
M1 = G;

% c) Lazos y determinante:
l1 = -G*H;

D = 1-l1;

% d) Cofactores:
D1 = 1;

% e) Mason:
FdTS2 = M1*D1/D
