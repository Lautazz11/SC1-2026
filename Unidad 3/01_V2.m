% UNIDAD 3 - EJERCICIO 1 V2
close all; clear; clc
pkg load symbolic

% Pasos para obtener la FdT de un sistema
% a partir de su modelo matemático

%% 1. Crear las variables simbólicas
syms s Y X real % real para crear v. simb. reales.

%% 2. Escribir las ecuaciones del modelo
eq1 = 5*s^2*Y + 2*s*Y + 3*Y == X + 5*s*X;
%nombre_variable = lado izq ec == lado derecho ec.

%% 3. Usar solve para despejar las variables de interés
S = solve(eq1, Y)

%% 4. Operar para encontrar la FdT simbólica.
Y_X = simplify(S/X)

%% 5. Convertir a un objeto tf
% 5.1 Separar numerador de denominador
[num_sym, den_sym] = numden(Y_X);

% 5.2 Convertir los polinomios simbólicos en numéricos.
num = sym2poly(num_sym)
den = sym2poly(den_sym)

% 5.3 Armar la FdT numérica
Y_X_num = tf(num,den)
