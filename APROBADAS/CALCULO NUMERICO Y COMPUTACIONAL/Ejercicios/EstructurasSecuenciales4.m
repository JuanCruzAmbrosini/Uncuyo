%Elaborar un algoritmo que lea dos puntos del plano X,Y, con coordenadas (X1,Y1) y (X2,Y2) y
%calcule la pendiente de la recta que pasa por dichos puntos. Imprimir el resultado.

function Pendiente

  clear
  clc

  x1 = input("Ingrese la coordenada en x del primer punto: ");
  y1 = input("Ingrese la coordenada en y del primer punto: ");
  x2 = input("Ingrese la coordenada en x del segundo punto: ");
  y2 = input("Ingrese la coordenada en x del segundo punto: ");

  pendiente = (y2 - y1)/(x2 - x1);

  disp("La pendiente es: "), pendiente

  endfunction
