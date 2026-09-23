% UNIDAD 3 - EJERCICIO 2
close all; clear all; clc

% 2.3) SIMULACION DE LA RESPUESTA AL ESCALON
%% Función de Transferencia del sistema:
s = tf('s');

W_V = 3000 / (s^2 + 156.25*s + 1837.5);
Vin = 10; % Voltaje de entrada

%% 1. Velocidad si Vin = 10;
% Aplicando el teorema del valor final w = 16.32 rad/seg
Vs = Vin / s
W = W_V * Vs

Wtinf = dcgain(s * W); % w = 16.32 rad/seg

% 2. Por simulación
step(Vin * W_V);
grid % w = 16.32 rad/seg


% OTRA FORMA: Para usar función lsim creamos escalón 10v
h = 1e-3;
t = 0:h:0.5;
u = 10 * ones(size(t));
%u = 10 * ones(1, length(t));

plot(t, u,'o', 'linewidth', 2); grid on
lsim(W_V, u, t); grid

% 2.4) DIBUJAR EL MAPA DE POLOS Y CEROS
pzmap(W_V);grid
disp('Terminado')

