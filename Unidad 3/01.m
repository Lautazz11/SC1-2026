% Unidad N° 3 Ejercicio 1
close all; clear all; clc
pkg load control

% Ec Dif:
% 5DDy+2Dy+3y-5Dx-x=0

% 1.1 Determinar Y(s)/X(s)
% a) Primero
% y(t) -> Y(s)
% Dy(t) -> sY(s)
% DDy(t) -> s^2Y(s)
% x(t) -> X(s)
% Dx(t) -> sX(s)

% 5s^2Y(s) + 2sY(s) + 3Y(s) = 5sX(s) + X(s)

% b) Segundo
% Y(s)(5s^2+2s+3) = X(s)(5s+1)

% c) Tercero:
% Y(s)(5s^2+2s+3)/X(s) = (5s+1)
% Y(s)/X(s) = (5s+1)/(5s^2+2s+3)

% Definición de la variable s y la FdT
s = tf('s');
Ys_Xs = (5*s+1)/(5*s^2+2*s+3)


% 1.2 Determinar la estabilidad.
p = pole(Ys_Xs);

if real(p) < 0
  disp('Sistema Estable')
else
  disp('Sistema Inestable')
endif

%roots([5 2 3])


% 1.3 Simulación
step(Ys_Xs,50)
grid on;
title('Respuesta al Escalón Unitario');

% ramp(Ys_Xs,50)

disp('Terminado')
