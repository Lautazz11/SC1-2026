% UNIDAD 2 - EJERCICIO 1: Funciones de Transferencia
close all; clear all; clc

pkg load symbolic;
syms R1 R2 C1 C2 s real


% CIRCUITO N°1:
G1 = 1/(1 + s*R1*C1)


% CIRCUITO N°2:
syms Vin I1 I2 real

X1 = 1/(s*C1);
X2 = 1/(s*C2);

eq1 = Vin == I1*(R1+X1)-I2*X1
eq2 = 0 == -I1*X1+I2*(X1+R2+X2)

% Despejando el termino I1 de la eq2
I1 = (I2*(X1+R2+X2)) / X1

% Reemplazo I1 en eq1
eq3 = Vin == ((I2*(X1+R2+X2)) / X1)*(R1+X1)-I2*X1

% Obtengo Vout
% Vout = I2*X2
syms Vout real

I2 = (Vout/X2)

% Reemplazando I2 en eq3
eq4 = Vin == (((Vout/X2)*(X1+R2+X2)) / X1)*(R1+X1)-(Vout/X2)*X1

% Resuelvo:
S = solve(eq4,Vout)

% F.T:
G2 = S/Vin


% CIRCUITO N°3:
G31 = 1/(1 + s*R1*C1);    % G1
G32 = 1/(1 + s*R2*C2);

% F.T es la funcion en cascada
G3 = G31*G32
