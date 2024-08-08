%Elaborar un algoritmo que lea dos puntos del plano X,Y, con coordenadas (X1,Y1) y (X2,Y2) y
%seleccione el punto de mayor ordenada. Imprimir el resultado.

function MayorOrdenada

  clear
  clc

  x1 = input("Ingrese la coordenada en x del primer punto: ");
  y1 = input("Ingrese la coordenada en y del primer punto: ");
  x2 = input("Ingrese la coordenada en x del segundo punto: ");
  y2 = input("Ingrese la coordenada en x del segundo punto: ");

  if (y1>y2)

    disp("El punto con mayor ordenada es el punto: "),x1,y1

  elseif (y2>y1)

    disp("El punto con mayor ordenada es el punto: "),x2,y2

  endif

