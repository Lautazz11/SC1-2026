% UNIDAD 2 - EJERCICIO 3
close all; clear all; clc
pkg load symbolic
pkg load control


% UNA FORMA DE HACERLO
% A) Defino las variables y F.T que tengo:
% 1. Constantes:
L = 1e-6;
R = 2;
Ka = 0.042;
J = 10e-6;
B = 0.30e-5;
Kb = 0.042;

% 2. F.Ts:
s = tf('s');

G1 = 1 / (L*s + R)
G2 = 1 / (J*s + B)

%% CASO M1 = W(S) / E(S)
% B) F.T entre velocidad y tension con algebra de bloques
% 1. FdTLA:
FdTLA = G1*Ka*G2

% 2. FdTLC: F.T del motor (M1)
M1 = FdTLA / (1 + FdTLA*Kb)

step(M1,0.2);

%% CASO M2 = I(S) / E(S)
% B) F.T entre corriente y tension con algebra de bloques
% 1. FdTLC: F.T del motor (M2)
M2 = G1 / (1 + G1*Ka*G2*Kb)

%% ------------
% DATO: Ambas F.T comparten el mismo denominador
%% ------------

% C) Señal de referencia
p = 0.001;
t = 0:p:0.1-p;

u = 24*ones(size(t));

% D) Simulacion
lsim(M1, u, t);

disp('terminado')


% -----------------------------------------
% OTRA FORMA DE HACERLO
close all; clear; clc
pkg load symbolic
pkg load control

syms L R Ka J B Kb s real

G1 = 1/(L*s + R);
G2 = 1/(J*s + B);

%% FdT W(s)/E(s) con Tl(s) = 0
FdTLa = G1*Ka*G2;

Ws_Es = FdTLa / (1 + Kb*FdTLa);
expand(simplify(Ws_Es))

%% FdT I(s) / E(s) con Tl(s) = 0
Is_Es = G1 / (1 + G1*Ka*G2*Kb);
expand(simplify(Is_Es))

%% FdT W(s) / Tl(s) con E(s) = 0;
Ws_Tl = -1*G2 / (1 + G2*Kb*G1*Ka);
simplify(Ws_Tl)

%% FdT I(s) / Tl(s) con E(s) = 0;
G = G2*Kb*(-1)*G1;
H = Ka;
Is_Tl = -G/(1 - G*H)
simplify(Is_Tl)

