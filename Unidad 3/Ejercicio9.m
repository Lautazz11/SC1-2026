% UNIDAD 3 - EJERCICIO 9
clear all; close all; clc
pkg load symbolic

% 1. Declaro las variables:
syms M C G R L Kb J Ka B s real
syms O Tm V I Om real

% 2. Ecs. dadas del modelo en TL:
% Ec. Robot
eq1 = M*(s^2)*O + C*s*O + G*O == Tm

% Ec. Motor
eq2 = V == R*I + L*s*I + Kb*s*Om
eq3 = J*(s^2)*Om == Ka*I - B*s*Om
eq4 = Tm == Ka*I

% 3. Resuelvo el sistema: despejo Tm, O, Om, I
% (La entrada V es un dato, no la despejo)

S = solve(eq1, eq2, eq3, eq4, Tm, O, Om, I)

% 4. Fdt: O(s)/V(s)
O_V = simplify(collect(S.O / V, s))
