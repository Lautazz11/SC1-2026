% UNIDAD 2 - EJERCICIO 11:
close all; clear all; clc
pkg load symbolic

% Defino mis variables
syms R L K J B s real

% Trayectorias directas
M1 = 1/L * 1/s * (K/J) * 1/s;

l1 = 1/s * (-R/L);
l2 = 1/s * (-B/J);
l3 = 1/s * K/J * 1/s * (-K/L);

D = 1-(l1+l2+l3)+(l1*l2);

D1 = 1;

G = M1*D1/D

Gsimp = factor(G, 's')
% O lo mismo: G = simplify(G)
