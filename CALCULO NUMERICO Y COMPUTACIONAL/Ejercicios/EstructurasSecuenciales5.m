%Elaborar un algoritmo que lea dos puntos del plano X,Y, con coordenadas (X1,Y1) y (X2,Y2) y
%calcule el valor de la abscisa Xr en la cual la recta que pasa por dichos puntos, intersecta al eje de las
%abscisas X. Imprimir el resultado Xr y el valor que toma la recta en Xr.

function RaizDeUnaRecta

  clear
  clc

  x1 = input("Ingrese la coordenada en x del primer punto: ");
  y1 = input("Ingrese la coordenada en y del primer punto: ");
  x2 = input("Ingrese la coordenada en x del segundo punto: ");
  y2 = input("Ingrese la coordenada en x del segundo punto: ");

  xr =(((y2-y1)/(x2-x1))*x1 - y1)/((y2-y1)/(x2-x1));

  y = ((y2-y1)/(x2-x1)) * (xr - x2) + y2;

  disp("La función intersecta al eje x "),xr
  disp("La función en xr toma el valor de: "), y

  endfunction
