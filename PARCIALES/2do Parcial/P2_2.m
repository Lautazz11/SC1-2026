# P2 - EJERCICIO 2: MARGENES DE ESTABILIDAD
clear all; close all; clc
pkg load symbolic
pkg load control

syms s K real;
s1 = tf('s')

# A) FdTs:
# 1. Planta
G = (10*s+840) / (s^3+69*s^2+1016*s-3696)

# 2. FdTLA
FdTLA = K*G

# 3. FdTLC
FdTLC = (FdTLA) / (1+FdTLA)
FdTLC_simp = collect(simplify(FdTLC),'s')

# B) EC. CARACTERISTICA: (1 + G*H)
den = 10*K*(s + 84) + s^3 + 69*s^2 + 1016*s - 3696
expand(den)

a0 = 1;
a1 = 69;
a2 = 1016+10*K;
a3 = 840*K-3696;

# 1. Lo resuelvo a mano con R-H
b1 = ((a1*a2) - (a0*a3)) / a1
b1_num = (a1*a2) - (a0*a3)

# 2. Condiciones de Estabilidad: (Margenes de K)
K_c1 = 3696 / 840
K_b1 = 73800 / 150

Kmin = 4.4;
Kmax = 492;

# C) LUGAR DE RAICES (L.R):
G_LR = (10*s1 + 840) / (s1^3 + 69*s1^2 + 1016*s1 - 3696);

# 1. Polos de la planta
p = pole(G_LR)

# 2. L.R
figure(1);
rlocus(G_LR); grid on;

# 3. Verifico margenes de K
# Caso dentro de Kmin < k < Kmax
figure(2)
step(feedback(100*G_LR,1),2)

# Caso fuera de Kmin < k < Kmax
figure(3)
step(feedback(500*G_LR,1),7)


