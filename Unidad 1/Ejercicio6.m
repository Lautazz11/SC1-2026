% UNIDAD 1 - EJERCICIO 6: Transformadas de Laplace

% gx -> funcion - GX -> Transformada de Laplace

close all; clear all; clc

% declaramos variables simbolicas reales t (tiempo), s (laplace), a y w (cte)
% pkg load symbolic
syms s t a w real

g1 = dirac(t);
G1 = laplace(g1)

g2 = heaviside(t);  % Funcion escalon u(t) se escribe heaviside en OCTAVE
G2 = laplace(g2)

g3 = exp(-2*t);
G3 = laplace(g3)

g4 = 7 * (exp(-5*t));
G4 = laplace(g4)

g5 = 1 + exp(-2*t);
G5 = laplace(g5)

g5v2 = 1 - exp(-2*t);
G5v2 = laplace(g5v2)

g6 = t * sin(2*t) + 3 * exp(-10*t);
G6 = laplace(g6)

g7 = exp(-5 *(t-2)) * heaviside(t-2);
G7 = laplace(g7)

g8 = exp(-a*t) * cos(w*t);
G8 = laplace(g8)


disp('Terminado')
