% UNIDAD 2 - EJERCICIO 2, SISTEMA 1:
close all; clear all: clc

pkg load control

% A) Defino variables que tengo
s = tf('s');
Kp = 31;
Kd = 16;
G1 = (53*(s+1)) / ((s+10)*(s+100));
G2 = 1/s;

% B) F.T por partes con algebra de bloques
% 1. Faux:
Faux = minreal(G1 / (1 + G1*Kd))

% Si estamos en presencia de un circuito realimentado:
Faux2 = feedback(G1,Kd)

% 2. FdTLA:
FdTLA = Kp*Faux*G2

% 3. FdTLC:
FdTLC = feedback(FdTLA,1)

step(FdTLC);

disp('Terminado')


% OTRA FORMA DE HACERLO:
% 1. Definir las FdTs
kp = tf(31, 1);
G1 = zpk([-1],[-10 -100],53);  % Zeros, polos y ganancia
G2 = tf(1,[1 0]);
kd = zpk([], [], 16);

% 2. FdTLC interna
FdTLCin = feedback(G1,kd)

[z,p,k] = zpkdata(FdTLCin, "V");

% 3. FdTLA
FdTLA = kp * FdTLCin * G2

% 4. FdTLC externa
FdTLC = feedback(fdTLA, 1)

