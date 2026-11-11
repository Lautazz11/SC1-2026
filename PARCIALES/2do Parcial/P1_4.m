# P1 - EJERCICIO 4: COMPENSADOR ATRASO/ADELANTO
clear all; close all; clc
pkg load control;

s = tf('s');

# A) PLANTA Y REQUERIMIENTOS:
G = 79 / (s^3+6.222*s^2+7.259*s)

# 1. Requerimientos
wn = 1;
psita = 0.75;

# B) PUNTO DE DISEÑO: veo si el L.R pasa por s1
figure(1)
rlocus(G);
sgrid(psita, wn)

s1 = -psita*wn + 1i*wn*sqrt(1-psita^2)
# Del grafico tambien veo la interseccion en s1 = -0.75+0.66*i, osea que no pasa

# C) ANGULO QUE DEBE APORTAR EL COMPENSADOR:
[z,p,~] = zpkdata(G,'v');
ang_comp = rad2deg(-pi + sum(angle(s1-p)) - sum(angle(s1-z)))

# 1. Veo que compensador es:
# - ang_comp > 0 -> Compensador en ADELANTO
# - ang_comp < 0 -> Compensador en ATRASO

# ang_comp = 7.56° > 0, entonces es compensador en ADELANTO

# D) METODO BISECTRIZ + TEOREMA DEL SENO:
ang_bis = 180 - acosd(psita);
ang_aux1 = 180 - (ang_bis/2 - ang_comp/2) - acosd(psita);
ang_aux2 = 180 - (ang_bis/2 + ang_comp/2) - acosd(psita);

if(ang_comp > 0)
disp('Compensador en ADELANTO')

# 1. Cero:
zc = -sind(ang_bis/2 - ang_comp/2)*abs(s1)/sind(ang_aux1)

# 2. Polo:
pc = -sind(ang_bis/2 + ang_comp/2)*abs(s1)/sind(ang_aux2)

else
disp('Compensador en ATRASO')

# 1. Cero:
zc = -sind(ang_bis/2 + ang_comp/2)*abs(s1)/sind(ang_aux2);

# 2. Polo:
pc = -sind(ang_bis/2 - ang_comp/2)*abs(s1)/sind(ang_aux1);
end

# E) VALIDO REDIBUJANDO EL L.R:
C = (s+0.9512) / (s+1.0513)   # C = tf([1 -zc],[1 -pc])

figure(2)
rlocus(C*G);
sgrid(psita, wn)
# Veo que en este nuevo grafico si se pasa por s1

# F) GANANCIA K: Aplico condicion de modulo
[num,den] = tfdata(C*G,'v');
Kp = 1/abs(polyval(num,s1) / polyval(den,s1))

# G) COMPENSADOR:
C = Kp*C

# H) VALIDACION Y SIMULACION:
FdTLC = feedback(C*G, 1)
FdTModelo = (wn^2) / (s^2+2*psita*wn*s+wn^2)

figure(3)
step(FdTLC, FdTModelo, 11); grid on;