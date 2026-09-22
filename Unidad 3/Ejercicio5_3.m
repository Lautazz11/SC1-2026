% UNIDAD 3 - EJERCICIO 5.3
close all; clear all; clc
pkg load symbolic

% 1. Variables simbolicas reales (var de cada ec.):
% Constantes del motor
syms Ra La Kb Jm Ki Bm real

% Señales del motor (TLs)
syms s V I W Tl real

% 2. Ecuaciones del modelo en el dominio de Laplace:
% Ec. Electrica
eq_elec = V == Ra*I + La*s*I + Kb*W

% Ec. Mecanica
eq_mec = Jm*s*W == Ki*I - Bm*W

Tl = 0;

%% 5.3) Fdt entre entrada v(t) y salida Om(t):
% FdT -> Q(s)/V(s)  , Tl(s) = 0
% w(t) = dq(t)/d(t)
% W(s) = s*Q(s) => Q(s) = W(s)/s

% 3. Resolver sist. algebraico despejando W y V
S = solve(eq_elec, eq_mec, V, W)

% 4. Armar la FdT W/V ordenando en potencias de s
W_V = collect(simplify(S.W / S.V),'s')

% 5. Hago la Q/V
Q_V = collect(simplify(1/s * W_V), 's')
