% 1ER PARCIAL - 3 (16/09/24): EJERCICIO 6
close all; clear all; clc
pkg load symbolic

% 1. Declaro variables:
syms C G1 G2 s real

C = 42 / s
G1 = 12 / ((s^2)+257*s)
G2 = 78 / (s+78)

% 2. Algebra de Bloques:
% a) FdT lazo cerrado
FdT1 = simplify(G1 + G2)

% b) FdT lazo abierto
FdT2 = simplify(C*FdT1)

% 3. Error en Estado Estable:
% a) Tipo de sistema: TIPO 2 (Dos polos en el origen)

% b) Determino constante de error:
Kv = simplify(s*FdT2)

s = 0;
Kv_val = eval(Kv)

% c) Error para Entrada Rampa:
disp(' ')
ess_r = eval(1/Kv)

% ----------------------------------
% SISTEMA TIPO 0
% Kp = cte, Kv = 0, Ka = 0
% ess_e = cte, ess_r = inf, ess_p = inf

% SISTEMA TIPO 1
% Kp = inf, Kv = cte, Ka = 0
% ess_e = 0, ess_r = cte, ess_p = inf

% SISTEMA TIPO 2
% Kp = inf, Kv = inf, Ka = cte
% ess_e = 0, ess_r = 0, ess_p = cte
% ----------------------------------
