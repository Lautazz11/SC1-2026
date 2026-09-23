% UNIDAD 2 - EJERCICIO 4
close all; clear all; clc
pkg load symbolic
pkg load control

% A) Defino las variables y F.T que tengo:
% 1. Constantes:
L = 1e-6;
R = 2;
Ka = 0.042;
J = 10e-6;
B = 0.3e-5;
Kb = 0.042;
Kp = 10;       % Controlador

% 2. F.Ts:
s = tf('s');

G1 = 1 / (L*s + R)
G2 = 1 / (J*s + B)

%% CASO M1
% B) F.T entre vel entrada y vel salida
% 1. FdTLA:
FdTLA = G1*Ka*G2

% 2. FdTLC: F.T del motor (M1)
M1 = FdTLA / (1 + FdTLA*Kb)

% 3. FdTLC: F.T velocidad (M2)
M2 = (Kp*M1) / (1 + Kp*M1)

% C) Señal de referencia
p = 0.0001;
t = 0:p:0.02-p;
u = 300*ones(size(t));

% D) Simulación
lsim(M2,u,t);

disp('Terminado')
