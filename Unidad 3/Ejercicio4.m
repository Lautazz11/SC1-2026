% UNIDAD 3 - EJERCICIO 4
close all; clear all; clc
pkg load control

% Valores dados para simular:
MA = 500; % Masa del automóvil
MS = 50;  % Masa de la suspensión
KR = 10;  % Resorte de la suspensión
KC = 50;  % Constante elástica de la cubierta
BA = 80;  % Amortiguador

% Coeficientes de la FdT
% num = [KC*BA, KC*KR];
% den = [MA*MS, BA*(MA + MS), MA*(KC + KR) + KR*MS, BA*KC, KC*KR];

G = tf(KC*[BA KR],...
      [MA*MS BA*MA+BA*MS MA*(KC+KR)+KR*MS BA*KC KC*KR]);

disp('Función de Transferencia X_A(s)/W(s):');
G

% Ganancia estática ante escalón unitario del camino
K_dc = dcgain(G);
fprintf('Ganancia estatica (asentamiento final): %.2f\n', K_dc);

% Simulación de la respuesta temporal al escalón de 1 metro
step(G, 100); grid on;
title('Respuesta al escalon del sistema de amortiguacion');
xlabel('Tiempo [s]');
ylabel('Amplitud [m]');
