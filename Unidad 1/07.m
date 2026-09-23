% UNIDAD 1 - EJERCICIO 7: Funciones de Transferencia
pkg load control
close all; clear all; clc

% declaramos variables simbolicas reales
% pkg load symbolic
syms s t real

% G1 = tf(NUM, DEN)

% G1 = tf(5*s^0, [1*s^1 + 2*s^0])
G1 = tf(5,[1 2])
G1p = zpk([], [-2], 5)
step(G1);grid

G2 = zpk([], [-2 -3], 1)  % zeros, polos y ganancia
step(G2);grid

G3 = tf(2,[1 2])
G3.inputdelay=10
step(G3);grid

G4 = tf(5*[1 1],[1 1 2])
G4p = zpk([-1], [-0.5+1.3229i -0.5-1.3229i], 5)
step(G4);grid

G5 = zpk([-2], [-3 -4], 5)
step(G5);grid

G6 = tf(5,[1 0])
step(G6);grid

G7 = zpk([-2], [0 -4], 12)
step(G7);grid

G8 = zpk([0], [ -40], 1)
step(G8);grid
