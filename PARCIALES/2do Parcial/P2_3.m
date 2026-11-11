# P2 - EJERCICIO 3: CONTROLADOR PROPORCIONAL P
clear all; close all; clc
pkg load control

s = tf('s');

# Requerimientos:
# - Respuesta Criticamente amortiguada
# - Raices reales e iguales
# - Sin sobrepasamiento -> Mp = 0

# A) FdT PLANTA:
G = 2 / ((s+15)*(s+3));
pole(G)

# B) L.R:
figure(1)
rlocus(G);

# C) SELECCIONO PUNTO DE DISEÑO:
s1 = -9;

# D) GANANCIA K: Aplico condicion de modulo |G(s)*H(s)| = 1/K
K1 = 1/abs(2 / ((s1+15)*(s1+3)))

# E) VALIDACION Y SIMULACION DE FdTLC:
FdTLC = feedback(K1*G, 1)
figure(2)
step(FdTLC, 2); grid on

# 1. Raíces Ec caracteristica deben valer s1
pole(FdTLC)

