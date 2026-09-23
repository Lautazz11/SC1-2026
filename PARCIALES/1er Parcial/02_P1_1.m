% 1ER PARCIAL - 1 (16/09/24): EJERCICIO 2
close all; clear all; clc
pkg load symbolic

% 1. DECLARO LAS VARIABLES
syms s real
C = 48 / s
G = (16*s) / (s+207)
Ct = 87 / (s+94)

% 2. ALGREBRA DE BLOQUES
% a) FdT Lazo cerrado:
FdT1 = G / (1+G*Ct)
FdT1_f = simplify(factor(G / (1 + G * Ct), 's'))
%FdT1_f = factor(simplify(G / (1 + G * Ct)))

% b) FdT Lazo abierto:
FdT2 = C*FdT1
FdT2_f = simplify(factor(C*FdT1, 's'))

% 3. ERROR EN ESTADO ESTABLE
% a) Tipo de FdT2: TIPO 0

% b) Determino constante de error:
Kp = FdT2_f

s = 0;
disp('----------')
Kp_val = eval(Kp)

% c) Error para Entrada Escalon:
disp(' ')
ess_e = eval(1/(1+Kp))

% ----------------------------------
% SISTEMA TIPO 0
% Kp = cte, Kv = 0, Ka = 0
% ess_e = cte, ess_r = inf, ess_p = inf

% SSISTEMA TIPO 1
% Kp = inf, Kv = cte, Ka = 0
% ess_e = 0, ess_r = cte, ess_p = inf

% SISTEMA TIPO 2
% ess_e = 0, ess_r = 0, ess_p = cte
% ----------------------------------
