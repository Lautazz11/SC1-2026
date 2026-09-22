% UNIDAD 3 - EJERCICIO 5.6
close all; clear all; clc
pkg load control

% 1. Defino variables y constantes
s = tf('s');

La = 10e-3;
Ra = 10;
Ki = 0.024;
Kb = 0.024;
Bm = 10e-5;
Jm = 10-6;

Vin = 24  % Tension de entrada

% 2. FdT: Velocidad Angular / Voltaje (W_V)
W_V = Ki / (Jm*La*s^2 + (Bm*La + Jm*Ra)*s + Bm*Ra + Kb*Ki)

% 3. Teorema del valor final
% w_ss = G(s) * V(s) con s=0
w_ss = dcgain(W_V) * Vin


% ---------------------------------------------------------
% CÁLCULO 2: Cantidad de vueltas en t = 10 seg
% ---------------------------------------------------------
% Función de Transferencia: Posición Angular / Voltaje (Q_V)
% Como la velocidad es la derivada de la posición, Q(s) = W(s) / s
Q_V = W_V * (1/s);


% Creamos un vector de tiempo hasta 10 segundos
h = 0.01;
t = 0:h:10;

% Creamos el vector de entrada: un escalón constante de 24V
u = 24 * ones(size(t));

% Simulamos la posición angular a lo largo de esos 10 segundos
[theta, t_out] = lsim(Q_V, u, t);

% Tomamos el último valor del vector theta (posición en t = 10)
angulo_final_rad = theta(end);

% Convertimos radianes a vueltas (1 vuelta = 2*pi radianes)
vueltas = angulo_final_rad / (2 * pi);

fprintf('Angulo total rotado: %.2f radianes\n', angulo_final_rad);
fprintf('Cantidad de vueltas: %.2f vueltas\n', vueltas);

% (Opcional) Graficar la posición a lo largo del tiempo
figure;
plot(t, theta, 'b', 'LineWidth', 2); grid on;
title('Posición Angular del Motor en 10 seg');
xlabel('Tiempo [s]');
ylabel('Posición \theta(t) [rad]');
