# P6 - EJERCICIO 4: RESPUESTA SISTEMA 2DO ORDEN
clear all; close all; clc
pkg load control

s = tf('s');

# PARAMETROS DE LA RESPUESTA TEMPORAL
# A) Valor de regimen:
yss = 2.4;

# B) Sobrepasamiento max:
ymax = 2.5;
Mp = (ymax - yss) / yss

# C) Tiempo pico:
tp = 10;

# PARAMETROS DE LA FdT
# D) Ganancia:
K = yss

# E) Coeficiente de amortiguamiento relativo:
# Mp = e^-pi*psita / (sqrt(1-psita^2))
psita = sqrt(log(Mp)^2 / (log(Mp)^2 + pi^2))

# F) Frecuencia natural no amortiguada:
# tp = pi / (Wn*sqrt(1-psita^2))
Wn = pi / (tp*sqrt(1-psita^2))

# G) FdT 2do orden:
G = (K*Wn^2) / (s^2 + 2*psita*Wn*s + Wn^2)
step(G, 25); grid on