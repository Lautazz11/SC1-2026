% UNIDAD 3 - EJERCICIO 5.4
close all; clear all; clc
pkg load symbolic

% 1. Variables simbolicas reales (var de cada ec.):
% Constantes del motor
syms Ra La Kb Jm Ki Bm real

% Señales del motor (TLs)
syms s V I W Tl Tm real

% 2. Ecuaciones del modelo en el dominio de Laplace:
% Ec. Electrica
eq_elec = V == Ra*I + La*s*I + Kb*W

% Ec. Mecanica
eq_mec = Jm*s*W == Ki*I - Bm*W

% Ec. Torque
eq_torque = Tm == Ki*I

Tl = 0;

%% 5.4) Fdt entre entrada v(t) y salida Tm(t):
% FdT -> Tm(s) / V(s)

% 3. Resolver sist. algebraico despejando
S = solve(eq_elec, eq_mec, eq_torque, Tm, I, V);

% 4. Armar la FdT Tm/V ordenando en potencias de s
Tm_V = collect(simplify(S.Tm / S.V),'s')


%% OTRA FORMA:
% Tm = Ki * I -> Ki = Tm(s)/I(s)
% Tm(s)/V(s) = Tm(s)/I(s) * I(s)/V(s)

S2 = solve(eq_elec, eq_mec, I, V);
I_V = collect(simplify(S2.I / S2.V));
Tm_I = Ki;
Tm_V = collect(simplify(Tm_I * I_V),'s');

