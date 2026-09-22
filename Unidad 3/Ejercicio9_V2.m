% UNIDAD 3 - EJERCICIO 9
close all; clear all; clc
syms M C G s Q Tm real

% 1. Declaro las variables:
syms M C G s Q Tm real
syms V L R Kb real
syms J B Ka real

% 2. Ecs. dadas del modelo en TL:
% Ecuación del robot
eq1 = M*s^2*Q + C*s*Q + G*Q == Tm

% Ecuación del motor
I = Tm / Ka;
eq2 = V == (L*s + R)*I + Kb*s*Q
eq3 = J*s^2*Q == Tm - B*s*Q

% Necesito encontrar: Q(s)/Tm(s), y Tm(s)/V(s)
% --> Q(s)/Tm(s)*Tm(s)/V(s)

% Haciendo solve(eq1,Q) encontramos Q(s) = Tm/(M*s^2 + C*s + G)
Q_Tm = 1/(M*s^2 + C*s + G)

% De eq3 buscamos Q como función de Tm solve(eq3, Q)
Q = Tm/(J*s^2 + B*s);
eq2p = eval(eq2);

% De solve(eq2p, Tm) -> Tm = V/((R + L*s)/Ka + (Kb*s)/(J*s^2 + B*s))
Tm_V = 1/((R + L*s)/Ka + (Kb*s)/(J*s^2 + B*s))

% Finalmente
Q_V = collect(Q_Tm * Tm_V, s)
