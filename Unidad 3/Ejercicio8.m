% UNIDAD 3 - EJERCICIO 8
clear all; close all; clc
pkg load symbolic

% 1. Declaro las variables:
syms I m l g M b s real
syms O X F real

% 2. Ecuaciones del modelo en TL:
eq1 = I*(s^2)*O + m*(l^2)*(s^2)*O == m*g*l*O + m*l*(s^2)*X
eq2 = (M+m)*(s^2)*X == F - b*s*X + m*l*(s^2)*O

% 3. Resuelvo el sistema: despejo O y F
S = solve(eq1, eq2, O, F);

% 4. FdT: O(s)/F(s)
O_F1 = simplify(factor(S.O / S.F, 's'))

% collect -> Agruga los coeficientes "s"
O_F2 = simplify(collect(S.O / S.F, s))

