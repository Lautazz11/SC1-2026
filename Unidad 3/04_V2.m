% UNIDAD 3 - EJERCICIO 4 (Para resolver 4.3)
close all; clear all; clc
pkg load symbolic

% 1. Variables simbólicas reales
syms s Ma Xa Xs Ba Kr Ms Kc W real

% 2. Ecuaciones del modelo en el dominio de Laplace
eq1 = Ma*s^2*Xa == Ba*s*(Xs - Xa) + Kr*(Xs - Xa);
eq2 = Ms*s^2*Xs == Ba*s*(Xa - Xs) + Kr*(Xa - Xs) + Kc*(W - Xs);

% 3. Resolver el sistema algebraico despejando Xa y W en función de Xs
S = solve(eq1, eq2, Xa, W);

% 4. Armar la FdT Xa/W ordenando en potencias de s
G_simb = factor(S.Xa / S.W, s, 's');
G_simb = simplify(G_simb);

disp('Función de Transferencia Simbólica:');
pretty(G_simb)

% 5. Reemplazar los valores numéricos del punto 4.4
G_num = subs(G_simb, {Ma, Ms, Kr, Kc, Ba}, {500, 50, 10, 50, 80});

disp('Función de Transferencia Numérica:');
pretty(G_num)
