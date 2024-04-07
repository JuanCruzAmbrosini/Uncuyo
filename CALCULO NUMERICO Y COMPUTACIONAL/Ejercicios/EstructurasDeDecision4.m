%Elaborar un algoritmo que lea dos puntos del plano X,Y, con coordenadas (X1,Y1) y (X2,Y2) y
%calcule el valor medio de X1 y X2, sólo si las ordenadas Y1 e Y2 tienen signos opuestos.
function ValorMedio

  clear
  clc

  x1 = input("Ingrese la coordenada en x del primer punto: ");
  y1 = input("Ingrese la coordenada en y del primer punto: ");
  x2 = input("Ingrese la coordenada en x del segundo punto: ");
  y2 = input("Ingrese la coordenada en y del segundo punto: ");

  if( y1>0 && y2<0 || y1<0 && y2>0)

  xMed = (x1 + x2)/2;
  yMed = (y1 + y2)/2;

  disp("El punto medio entre P1 y P2 es: "), xMed, yMed

  else

   disp("Las ordenadas no son de signos opuestos.")

   endif

  endfunction
