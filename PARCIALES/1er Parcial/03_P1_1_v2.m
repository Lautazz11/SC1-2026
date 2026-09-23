% 1ER PARCIAL - 1 (16/09/24): EJERCICIO 3
clear all; close all; clc
pkg load symbolic

% 1. Declaro variables:
syms J m T R L K g real
syms D Q V s real

% 2. Ecs. dadas en TL:
eq1 = (J/R^2 + m)*D*s^2 == -m*g*Q/L;
eq2 = Q == (K/T)*V/(s+1/T);

% 3. Resuelvo sistema algebraico: despejo D y V
S = solve(eq1, eq2, D, V);

% 4. FdT:
FdT = simplify(factor(S.D/S.V, 's'))

% 5. Simulo con los valores dados:
J = 0.000004 %kg*m^2
m = 0.25 %kg
T = 0.002 %s
R = 0.03 %m
L = 0.45 %m
K = 36 %rad/v
g = 9.81 %m/s^2

D_V = eval(FdT)
