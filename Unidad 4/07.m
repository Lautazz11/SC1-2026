% UNIDAD 4 - EJERCICIO 7
clear all; close all; clc
pkg load control

% 1. Declaro variables
s=tf('s')

% 2. FdTs:
G1 = 15/(5*s+1);step(G1);grid on
G2 = 1/(5*s+1);step(G2);grid on
G3 = 1/(s+5);step(G3);grid on
G4 = 15/(s+5);step(G4);grid on
G5 = 15/(5*s+1);G5.inputdelay=2;step(G5);grid
G6 = 625/(s^2+60*s+625);step(G6);grid
G7 = 1875/(s^2+60*s+625);step(G7);grid
G8 = 1875/(s^2+60*s+625);G8.inputdelay=0.1;step(G8);grid
G9 = 1875/((s+46.58)*(s+13.42));G9.inputdelay=0.1;step(G9);grid
G10 = 187500/(s^2+600*s+62500); step(G10);grid
G11 = 0.1875/(s^2+0.6s+0.0625);step(G11);grid
G12 = 0.0625/(s^2+0.35s+0.0625);step(G12);grid
G13 = 0.0625/(s^2+0.3s+0.0625);step(G13);grid
G14 = 0.0625/(s^2+0.3s+0.0625);G14.inputdelay=5;step(G14);grid
G15 = 0.1563/(s^2+0.3s+0.0625);G14.inputdelay=5;step(G15);grid
G16 = 0.0625/(s^2+0.0625);step(G16,50);grid
G17 = 0.25/(s^2+0.25);step(G17,50);grid
G18 = 0.5/(s^2+0.25);step(G18,50);grid
G19 = 2/(3*s+1)^2;step(G19);grid
G20 = 2/(3*s+1)^2;G20.inputdelay=4;step(G20);grid

% a) Estable?
% b) Tiempo de establecimiento?
% c) Valor de la salida en estado estable?

% --- PARA G1: ---
% a) Estable?
% -> polo en -1/5, es estable

% b) Tiempo de establecimiento?
% -> ts = 4*tau = 4*5 = 20 seg

% c) Valor de la salida en estado estable?
% -> K = 15


% ---PARA G3: ---
% a) Estable?
% -> polo en -5, es estable

% b) Tiempo de establecimiento?
% -> ts = 4/abs(pole) = 4/5 = 0.8 seg

% c) Valor de la salida en estado estable?
% -> K = 0.2
