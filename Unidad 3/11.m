% UNIDAD 3 - EJERCICIO 11
clear all; close all; clc
pkg load symbolic

% 1. Declaro las variables
syms O I R s real
syms K1 K2 real

% 2. Ecs dadas del modelo en TL:
eq1 = (s^3)*O + 5*(s^2)*O + 4*s*O == 2*I
eq2 = s*I + I == s*(R - K1*O - K2*s*O)

% 3. Resuelvo el sistema: despejo R y O
S = solve(eq1, eq2, I, O)

% 4. FdT: O(s)/R(s)
O_R = simplify(collect(S.O / R, s))


