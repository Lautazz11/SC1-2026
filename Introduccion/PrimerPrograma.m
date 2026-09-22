% Inicio del Script (siempre ponerlos)
pkg load control;
clc;
clear all;
close all;

% Definimos las variables
a = 5;
b = 32.45;
c = 15;
d = sqrt(2);

% Ejecutamos las operaciones
x = a - b;

% Vectores
vFila = [1 2 3];
% x^2 + 2x + 3 (forma polinomio)

vFila2 = [1 2 3 0];
% x^3 + 2x^2 + 3x (forma polinomio)

vCol1 = [4 5 6]';
vCol2 = [7; 8; 9; 10];

% 2da forma de definir vectores
% vector = valor inicial : paso : valor final
vInicial = 0;
vFinal = 1;
paso = 0.01;

t2 = vInicial : paso : vFinal;

% Matriz 4x4
mat4x4 = [11 12 13 14;...
          21 22 23 24;...
          31 32 33 34;...
          41 42 43 44]

% Transpuesta
transMat4x4 = mat4x4'

% Determinante
detMat4x4 = det(mat4x4)

% Matriz identidad (diagonal)
matI = eye(4)

det(matI)

% Inversa
invMatI = inv(matI)

% Multiplicacion de matrices (no es conmutativa)
matI * mat4x4

mat4x4 * transMat4x4

% Funciones trigonometricas
t = [0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9];
y = sin(10 * t);
y2 = sin(10 * t2);

plot(t,y, t2,y2)

% Texto
disp("Fin programa")
