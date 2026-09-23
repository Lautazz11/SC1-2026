% UNIDAD 3 - EJERCICIO 3
close all; clear all; clc
pkg load control
pkg load symbolic

% Constantes genéricas del sistema
syms M B K s real

% Funciones de Transferencia
G_pos = 1 / (M*s^2 + B*s + K);      % X(s)/F(s)
G_vel = s / (M*s^2 + B*s + K);      % V(s)/F(s)
G_ace = s^2 / (M*s^2 + B*s + K);    % A(s)/F(s)

disp('FdT Posicion / Fuerza:');
G_pos
disp('FdT Velocidad / Fuerza:');
G_vel
disp('FdT Aceleracion / Fuerza:');
G_ace

% 3. Polos del sistema (raíces del denominador común)
denominador = M*s^2 + B*s + K;
polos = solve(denominador == 0, s);

disp('Polos del sistema (compartidos por las tres FdT):');
pretty(polos)
