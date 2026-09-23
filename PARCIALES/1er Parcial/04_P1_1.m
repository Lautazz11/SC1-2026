% 1ER PARCIAL - 1 (16/09/24): EJERCICIO 3
clear all; close all; clc
pkg load control
s = tf('s')

% 1. Declaro variables:
% a) Ganancia K
K = 1

% b) Cte de tiempo Tau
tau = 0.05

% 2. FdT 1er Orden:
G = K / (tau*s + 1)

% 3. Grafico para comparar:
step(G, 0.25); grid on

