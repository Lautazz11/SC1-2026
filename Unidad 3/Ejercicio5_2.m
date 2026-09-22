% UNIDAD 3 - EJERCICIO 5.2
close all; clear all; clc
pkg load symbolic

% 1. Declaro las variables:
syms Ra La Kb Jm Ki Bm real % Constantes del motor
syms s V I W Tl real        % Señales del motor (TLs)

% 2. Ecs. dadas en TL:
% Ec. Electrica
eq_elec = V == Ra*I + La*s*I + Kb*W

% Ec. Mecanica
eq_mec = Jm*s*W == Ki*I - Bm*W

Tl = 0;

%% 5.2) Fdt entre entrada v(t) y salida Wm(t):
% FdT --> W(s)/V(s) , Tl(s) = 0

% 3. Resolver sistema algebraico: despejo W y V
S = solve(eq_elec, eq_mec, V, W)

% 4. FdT:
W_V = collect(simplify(S.W / S.V),'s')

