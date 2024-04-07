%Las siguientes desigualdades definen un área en el plano x-y. Desarrolle un algoritmo para que
%determine si un punto de coordenadas dadas (X1, Y1 ), se encuentra o no dentro del área definida.
%       Y < 3
%       X+Y > 1
%       Y < 2X + 1
%       Y > X

function DentroDelAreaDefinida

  clear
  clc

  x = input("Ingrese la coordenada en x del punto a evaluar: ");
  y = input("Ingrese la coordenada en y del punto a evaluar: ");

  if(y < 3 && x+y > 1 && y < 2*x + 1 && y > x)

  disp ("El punto se encuentra dentro de la zona designada.");

  else

  disp("El punto no se encuentra dentro de la zona designada.");

  endif

  endfunction
