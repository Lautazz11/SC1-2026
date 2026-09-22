% UNIDAD 3 - EJERCICIO 7 (Modelos equivalentes del Motor Faulhaber)
close all; clear all; clc
pkg load control

% --- 1. PARÁMETROS DEL MOTOR (SI) ---
R  = 5.8;
L  = 135e-6;
J  = 1.6e-7;
Ki = 14.48e-3;
Kb = 1.515e-3 * (60 / (2*pi));
w_vacio = 7500 * (2*pi/60);
B  = 0.29e-3 / w_vacio;

% --- 2. MODELO COMPLETO (3er Orden real considerando inductancia) ---
s = tf('s');
num_comp = Ki;
den_comp = (L*J)*s^2 + (R*J + B*L)*s + (R*B + Ki*Kb);
G_completa = num_comp / den_comp;

% --- 3. MODELOS SIMPLIFICADOS (Ejercicio 7) ---
K_dc = w_vacio / 12;                 % Ganancia estática
tau_m = (R*J) / (R*B + Ki*Kb);       % Constante de tiempo mecánica[cite: 1]

% Modelo 1er Orden
G_1er = K_dc / (tau_m * s + 1);      %[cite: 1]

% Modelo 2do Orden
G_2do = K_dc / ((tau_m / 2)*s + 1)^2; %[cite: 1]

% --- 4. SIMULACIÓN Y COMPARACIÓN ---
figure;
hold on;
% Simulamos con un escalón de 12V
step(12 * G_completa, 'b', 0.02);
step(12 * G_1er, 'r--', 0.02);
step(12 * G_2do, 'g-.', 0.02);
grid on;

title('Comparación de Modelos: Motor Faulhaber 12V');
xlabel('Tiempo [s]');
ylabel('Velocidad Angular [rad/s]');
legend('Modelo Completo', '1er Orden', '2do Orden', 'Location', 'southeast');
