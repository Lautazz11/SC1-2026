% UNIDAD 3 - EJERCICIO 8 (MASON)
close all; clear all; clc
pkg load symbolic

% 1. Declaro las variables:
syms M m l J g b s real
syms X Theta F real

% 2. MASON:
% a) Trayectorias directas: N=1

% b) Ganancias:
% (Ruta de F -> s^2 X -> s^2 Theta -> Theta)
P1 = 1/(M+m) * (m*l)/(J+m*l^2) * 1/s^2;

% c) Lazos y determinante:
% L1: Lazo del carro (s^2 X -> sX -> s^2 X)
L1 = 1/s * (-b/(M+m));

% L2: Lazo del péndulo (s^2 Theta -> Theta -> s^2 Theta)
L2 = 1/s^2 * (m*g*l)/(J+m*l^2);

% L3: Lazo cruzado (s^2 X -> s^2 Theta -> s^2 X)
L3 = (m*l)/(J+m*l^2) * (m*l)/(M+m);

% Determinante (L1 y L2 son lazos disjuntos porque no comparten nodos)
det = 1 - (L1+L2+L3) + (L1*L2);

% d) Cofactor:
% P1 toca todos los lazos del sistema
cof1 = 1;

% e) Regla de Mason:
Gmason = (P1*cof1) / det;

% Simplificamos y agrupamos en potencias de Laplace ('s')
G = factor(simplify(Gmason), 's')
