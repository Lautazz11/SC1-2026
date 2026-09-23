% UNIDAD 4 - EJERCICIO 8
clear all; close all; clc
pkg load control
s = tf('s')

% ------- A) SISTEMA 1 -------
% 1. Declaro variables:
% a) K (Ganancia)
K = 1

% b) tau (cte de tiempo)
tau = 1e-4

% 2. FdT 1er Orden:
G = K / (tau*s + 1)

% 3. Grafico para comparar:
step(G, 8e-4); grid on

% G=tf(1,[0.1e-3 1]);
% Tfinal=8e-4;
% step(G,Tfinal);grid


% ------- B) SISTEMA 2 -------
% 1. Declaro variables:
% a) K (Ganancia)
K = 0.9

% b) tau (cte de tiempo)
tau = 0.23e-3
%tau = 2.4e-4

% 2. FdT 1er Orden:
G = K / (tau*s + 1)

% 3. Grafico para comparar:
step(G, 2e-3); grid on


% ------- C) SISTEMA 3 -------
% 1. Declaro variables:
% a) K (Ganancia)
K = 8500

% b) tau (cte de tiempo)
tau = 10

% 2. FdT 1er Orden:
G = K / (tau*s + 1)

% 3. Grafico para comparar:
step(G, 90); grid on


% ------- D) SISTEMA 4 -------
% 1. Declaro variables:
% a) K (Ganancia)
K = 95

% b) tau (cte de tiempo)
tau = 50

% c) Tiempos
ts = 300; % [seg] Tiempo de establecimiento al 100%
td = 100; % [seg] Tiempo de retardo

% 2. FdT 1er Orden (Sin retardo):
G_sin_retardo = K / (tau*s + 1);

% 3. Aplicamos el retardo temporal mediante Aproximación de Padé (1er orden)
% exp(-td*s) ≈ (1 - (td/2)*s) / (1 + (td/2)*s)
Aprox_Pade = (1 - (td/2)*s) / (1 + (td/2)*s);

% 4. FdT Completa:
G = G_sin_retardo * Aprox_Pade;

% 5. Grafico para comparar:
step(G, 500); grid on;


% ------- E) SISTEMA 5 -------
% 1. Declaro variables:
% a) K (Ganancia)
K = 0.75

% b) tau (cte de tiempo)
tau = 0.3e-6

% 2. FdT 1er Orden:
G = K / (tau*s + 1)

% 3. Grafico para comparar:
step(G, 4e-6); grid on


% ------- F) SISTEMA 6 -------
% 1. Declaro variables:
% a) K (Ganancia)
K = 0.8

% b) tau (cte de tiempo)
tau = 0.7e-3

% c) Tiempos
ts = 5e-3; % [seg] Tiempo de establecimiento al 100%
td = 1e-3; % [seg] Tiempo de retardo

% 2. FdT 1er Orden (Sin retardo):
G_sin_retardo = K / (tau*s + 1);

% 3. Aplicamos el retardo temporal mediante Aproximación de Padé (1er orden)
% exp(-td*s) ≈ (1 - (td/2)*s) / (1 + (td/2)*s)
Aprox_Pade = (1 - (td/2)*s) / (1 + (td/2)*s);

% 4. FdT Completa:
G = G_sin_retardo * Aprox_Pade;

% 5. Grafico para comparar:
step(G, 8e-3); grid on;
