%Elaborar un algoritmo que lea dos puntos del plano X,Y, con coordenadas (X1,Y1) y (X2,Y2) y
%calcule el punto medio de ambos. Imprimir el resultado
function PuntoMedio
  clear
  clc

  x1 = input("Ingrese la coordenada en X del primer punto: ");
  y1 = input("Ingrese la coordenada en Y del primer punto: ");

  x2 = input("Ingrese la coordenada en X del segundo punto: ");
  y2 = input("Ingrese la coordenada en Y del segundo punto: ");

  xMed = (x1 + x2)/2;
  yMed = (y1 + y2)/2;

  disp("El punto medio entre P1 y P2 es: "),xMed,yMed

  endfunction

