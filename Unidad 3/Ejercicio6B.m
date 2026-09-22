% UNIDAD 3 - EJERCICIO 6B (Motor Faulhaber 1741 012 CXR)
close all; clear all; clc
pkg load control
s = tf('s');

% 1. Parámetros físicos convertidos al(SI)
R  = 5.8;                      % Resistencia [Ohms]
L  = 135e-6;                   % Inductancia [H]
J  = 1.6e-7;                   % Inercia [kg*m^2]
Ki = 14.48e-3;                 % Constante de torque [Nm/A]

% Constante FCEM: mV/rpm -> V/(rad/s)
Kb = 1.515e-3 * (60 / (2*pi));

% Fricción viscosa (B) deducida del torque de fricción en vacío
w_vacio = 7500 * (2*pi/60);    % Velocidad de vacío en rad/s
B  = 0.29e-3 / w_vacio;        % Fricción [Nms/rad]

% 2. FdT:
G = Ki / ((L*J)*s^2 + (R*J + B*L)*s + (R*B + Ki*Kb));

disp('Función de Transferencia del Motor Faulhaber:');
G

% 3. Simulación de respuesta al escalón nominal de 12V
figure;
step(12 * G); grid on;
title('Respuesta Motor Faulhaber 012 CXR a 12V');
xlabel('Tiempo [s]');
ylabel('Velocidad Angular \omega(t) [rad/s]');

% Dato extra: Mostrar la velocidad final en RPM para validar con el Datasheet
vel_final_rads = dcgain(12 * G);
vel_final_rpm = vel_final_rads * (60 / (2*pi));

fprintf('Velocidad final simulada: %.2f RPM\n', vel_final_rpm);
fprintf('Velocidad de vacío según datasheet: 7500 RPM\n');
