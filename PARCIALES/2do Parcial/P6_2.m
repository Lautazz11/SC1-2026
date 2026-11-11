# P6 - EJERCICIO 2: COMPENSADOR PI
clear all; close all; clc
pkg load control

s = tf('s');

# Requerimientos:
# CASO 1: SIN SOBREPASAMIENTO
# - Respuesta criticamente amortiguada -> raices reales e iguales
# - Tiempo de establecimiento ts minimo

# CASO 2: SOBREPASAMIENTO MAX 4%
# - Respuesta sobreamortiguada -> raices reales y distintas
# - Tiempo de establecimiento ts minimo
psita = 0.707

# COMPENSADOR PI = Kp * (s+1/Ti)/s

# A) FdT PLANTA:
G =  (43*s+3182) / (s^3+81*s^2+2108*s+17766)

# B) FdT DEL PI:
# 1. Polo dominante
pole(G)
Pd = -20.091;
Ti = -1/Pd

# 2. PI sin Kp
PI = (s+1/Ti)/s

# C) FdTLA:
FdTLA = minreal(PI*G)

# D) L.R DE LA FdTLA:
figure(1)
rlocus(FdTLA);
sgrid(psita, [])


# CASO 1: SIN SOBREPASAMIENTO
# 1. Punto de Diseño
s1 = -10.409;

# 2. Ganancia K: Aplico condicion de modulo con FdTLA
Kp1 = 1/abs((43*s1+3182) / (s1^3+60.91*s1^2+884.3*s1))


# 3. PI con Kp
PI1 = Kp1*PI;

# E) VALIDACION Y SIMULACION:
FdTLC1 = minreal(feedback(PI1*G, 1))
pole(FdTLC1)
figure(2)
step(FdTLC1, 1.5)


# CASO 2: SOBREPASAMIENTO MAX 4%
# 1. Punto de Diseño
s2 = -9.63+9.63*i;

# 2. Ganancia K: Aplico condicion de modulo con FdTLA
Kp2 = 1/abs((43*s2+3182) / (s2^3+60.91*s2^2+884.3*s2))

# 3. PI con Kp
PI2 = Kp2*PI;

# E) VALIDACION Y SIMULACION:
FdTLC2 = minreal(feedback(PI2*G, 1))
pole(FdTLC2)
figure(3)
step(FdTLC2, 2)

# Comparo ambos juntos
figure(4)
step(FdTLC1, FdTLC2, 1.5)

