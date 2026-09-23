% UNIDAD 3 - EJERCICIO 6A
clear all; close all; clc
pkg load symbolic

% 1. Declaro las variables simbolicas:
syms X1 X2 U real           % FdTs
syms M1 B1 K1 K2 M2 s real  % Ganancias

% 2. Ecs. dadas en TL:
eq1 = M1*(s^2)*X1 == B1*s*(U-X1) + K1*(U-X1) + K2*(X2-X1)
eq2 = M2*(s^2)*X2 == K2*(X1-X2)

% 3. Resuelvo sistema algebraico: despejar X1, X2
% (La entrada U no se despeja, es dato)
S = solve(eq1, eq2, X1, X2)

% 4. FdTs:
disp('FdT X1/U:')
X1_U = simplify(factor(S.X1 / U, 's'))

disp('FdT X2/U:')
X2_U = simplify(collect(S.X2 / U, s))
