% UNIDAD 2 - EJERCICIO 2, SISTEMA 3:
close all; clear all: clc

pkg load control
pkg load symbolic

% A) Defino variables que tengo
syms Kp Ti Td s Wn p real

Planta = Wn^2 / (s^2+2*p*Wn*s+Wn^2)
G1 = (Ti*Td*s^2 + Ti*s+1) / (Ti*s)

% B) F.T por partes con algebra de bloques
% 1. PID:
PID = Kp*G1

% 2. FdTLA:
FdTLA = PID*Planta

% 3. FdTLC:
% FdTLC = feedback(FdTLA,1)
FdTLC = FdTLA / (1+FdTLA)

% vista simplificada
FdTLC = factor(FdTLC)

% Para saber más sobre la función factor:
% help @sym/factor
