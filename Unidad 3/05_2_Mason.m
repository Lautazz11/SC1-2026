% UNIDAD 3 - EJERCICIO 5.2 (MASON)
close all; clear all; clc
pkg load symbolic

% 1. Declaro las variables:
syms Ra La Kb Jm Ki Bm s real
syms V I W Tl real

% 2. MASON:
% a) Trayectorias directas: N=1

% b) Ganancias:
P1 = 1/La * 1/s * Ki/Jm * 1/s

% c) Lazos y determinante:
L1 = 1/s * (-Bm/Jm)
L2 = 1/s * (-Ra/La)
L3 = 1/s * Ki/Jm * 1/s * (-Kb/La)

det = 1 - (L1+L2+L3) + (L1*L2)

% d) Cofactor:
cof1 = 1

% e) Regla de Mason:
Gmason = (P1*cof1) / det

G = factor(Gmason, 's')

