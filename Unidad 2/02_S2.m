% UNIDAD 2 - EJERCICIO 2, SISTEMA 2:
close all; clear all: clc

pkg load control

% A) Defino variables que tengo
P = 12;
PI = (s+0.1) / s;
G1 = 27 / (s+200);
G2 = 5 / (s+0.1);

% B) F.T por partes con algebra de bloques
% 1. Faux:
Faux = feedback(P*G1,1);
% Faux = (P*G1) / (1 + P*G1);

% 2. FdTLA:
FdTLA = minreal(PI*Faux*G2)

% 3. FdTLC:
FdTLC = feedback(FdTLA,1)

step(FdTLC,8);

disp('Terminado')

