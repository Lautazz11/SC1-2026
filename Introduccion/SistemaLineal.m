% Resolver el sistema lineal. Verificar la solucion.
% 0.107*x - 0.0654*y + 0.494*z = 0.198
% 0.891*x - 0.334*y - 0.699*z = 0.744

% A * x = b -> x = A^-1 * b
% Preguntar si:
% A * x = b
% A * x - b = 0

clear all; close all; clc;

% RESOLUCION:
A = [0.107 -0.654 0.494;...
    -0.779 -0.715 0.904;...
     0.891 -0.334 -0.699];

b = [0.198;...
     0.031;...
     0.744];

x = inv(A) * b;

% VERIFICACION:
% Estas comparaciones dan error ya que la compu tiene mas resolucion:
A * x == b
A * x - b == [0; 0; 0]
A * x - b

% Entonces: (comparamos con valor chico cerca de cero)
A * x - b <= [1e-5; 1e-5; 1e-5]
abs(A * x - b) <= [1e-5; 1e-5; 1e-5]
