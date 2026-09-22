% UNIDAD 3 - EJERCICIO 11.2
clear all; close all; clc
pkg load symbolic

% 1. Declaro variables:
syms K1 K2 s real

% 2. FdTs del sistema:
G1 = s / (s+1)
G2 = 2 / ((s^3)+5*(s^2)+4*s)
H1 = K2*s
H2 = K1

% 3. Algebra de Bloques:
% 1) F1: Sistema en cascada
F1 = G1*G2

% 2) F2: FdT lazo cerrado
F2 = factor(simplify(F1 / (1 + F1*H1)))

% 3) F3: FdT lazo cerrado final
F3 = factor(simplify(F2 / (1 + F2*H2)))



