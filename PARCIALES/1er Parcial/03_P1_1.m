% 1ER PARCIAL - 1 (16/09/24): EJERCICIO 3
clear all; close all; clc
pkg load symbolic

% 1. Declaro variables:
syms J R m g L K T real   % Ganancias
syms O D V s real         % Variables para FdT

% 2. Ecs. dadas en TL:
eq1 = (J/(R^2)+m)*(s^2)*D == ((-m*g)/L)*O
eq2 = O == (K/(T*s+1))*V

% 3. Resuelvo sistema algebraico: despejo D y O
S = solve(eq1, eq2, D, O)

% 4. FdT:
D_V = simplify(factor(S.D / V, 's'))

% 5. Simulo con los valores dados:
% J = 0.000004  %kg*m^2
% m = 0.25      %g -> kg
% T = 0.002   %seg
% R = 0.03      %cm -> m
% L = 0.45      %m
% K = 36        %rad/v
% g = 9.81      %m/s^2

D_V_num = subs(D_V, {J, m, T, R, L, K, g}, ...
                    {0.000004, 0.25, 0.002, 0.03, 0.45, 36, 9.81})

% D_V_sim = eval(D_V)

