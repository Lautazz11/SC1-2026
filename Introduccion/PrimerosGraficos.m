% PRIMEROS GRAFICOS
% Vamos a graficar las funciones seno y coseno
% de un angulo en el intervalo -pi, pi
close all; clear all; clc

% Generar vector que representa angulo alfa:
% v = vInicial : vPaso : vFinal;
alfaInicial = -pi;
alfaFinal = pi;
alfaPaso = 1e-3;

alfa = alfaInicial : alfaPaso : alfaFinal;

% Para llamar a un elemento del vector:
% vector(indice)}
% length(vector)

% Generar funciones cos(alfa) y seno(alfa):
cosAlfa = cos(alfa);
sinAlfa = sin(3 * alfa);

% Graficar:
% plot(ejeX1, ejeY1)
% plot(ejeX1, ejeY1, PARAMETROS1, ejeX2, ejeY2, PARAMETROS2)
%plot(alfa, cosAlfa);
%hold on;
%plot(alfa, sinAlfa);
plot(alfa, cosAlfa, '-.r', ...
     alfa, sinAlfa, 'linewidth', 2, ...
     alfa, cosAlfa + sinAlfa);

title('Funciones trigonometricas de \alpha')
xlabel('ang [rad]');
ylabel('amplitud');
legend('cos(\alpha)', 'sin(\alpha)', 'cos(\alpha) + sin(\alpha)');
grid;

% subplot (para tener distintos graficos en misma figura)
% subplot(filas, columnas, indice);
etiquetaEjeX = 'ang [rad]';
etiquetaEjeY = 'amplitud []';

subplot(2,1,1);   % (2 filas, 1 columna)
  plot(alfa, cosAlfa, 'linewidth', 2);
  grid
  xlabel(etiquetaEjeX);
  ylabel(etiquetaEjeY);
  title('Funcion coseno de \alpha');
subplot(2,1,2);
  plot(alfa, sinAlfa, '-.', 'linewidth', 2);
  grid
  xlabel(etiquetaEjeX);
  ylabel(etiquetaEjeY);
  title('Funcion seno de \alpha');

disp('Fin programa');
