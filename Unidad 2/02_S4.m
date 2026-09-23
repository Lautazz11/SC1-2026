% UNIDAD 2 - EJERCICIO 2, SISTEMA 4:
close all; clear all: clc

pkg load control
pkg load symbolic

% A) Defino variables que tengo
syms Ti Td s Kp K T real

G1 = K / (T*s+1);

% B) F.T por partes con algebra de bloques
% 1. PID:
PID1 = (1/Ti)*(1/s)
PID2 = Td*s

PID3 = PID1+PID2

% 2. PID total:
PID = (1+PID3)*Kp

% 3. FdTLA:
FdTLA = PID*G1

% 4. FdTLC:
FdTLC = FdTLA / (1+FdTLA)

FdTLC1 = factor(simplify(FdTLA/(1+FdTLA)))

