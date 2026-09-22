% UNIDAD 4 - EJERCICIO 1
clear all; close all; clc
pkg load symbolic

% 1. Declaro variables:
syms s K real

% 2. FdTs:
%G = 50 / ((1+0.5*s)*(1+2*s))                       % G1
G = 2 / (s*(1+0.1*s)*(1+0.5*s))                   % G2
%G = 1 / (s*(s^2+4*s+200))                         % G3
%G = (30*(1+2*s)*(1+4*s)) / (s*(s^2+2*s+10))       % G4
%G = (10*(s+1)) / (s*(s+4)*(4*s^2+6*s+1))          % G5
%G = K / ((1+s)*(1+10*s)*(1+20*s))                 % G6
%G = (10*(s+1)) / ((s^2)*(s+5)*(s+6))              % G7
%G = (10*(s+1)) / ((s^3)*(s^2+5*s+5))              % G8
%G = (10*exp(-0.2*s)) / ((1+s)*(1+10*s)*(1+20*s))  % G9
%G = (100*(s+1)) / ((s^2)*(s+5)*(s+6)^2)           % G10
%G = 1000 / (s*(s+10)*(s+100))                     % G11
%G = (3*s) / ((s^2)*(s+6))                         % G12

% 3. Constantes de error:
Kp = G
Kv = simplify(s*G)
Ka = simplify(s^2*G)

s = 0;
Kp_val = eval(Kp)
Kv_val = eval(Kv)
Ka_val = eval(Ka)

% 4. Error para las distintas entradas:
disp(' ')
% Entrada Escalon
ess_e = eval(1/(1+Kp))

% Entrada Rampa
ess_r = eval(1/Kv)

% Entrada Parabola
ess_p = eval(1/Ka)

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

