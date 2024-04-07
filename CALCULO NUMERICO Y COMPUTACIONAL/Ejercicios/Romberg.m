%??????????????????????????????????????????????????????????????????????????????????????????????????????
%Los resultados exactos son I1= pi e I2= 0. Verifique numéricamente dichos resultados aplicando la
% regla de trapecios compuesta y realizando integración de Romberg. Elaborar o modificar el programa
% MATLAB para calcular I1 e I2 con distinta cantidad de intervalos, y así analizar la solución
% aproximada.
%??????????????????????????????????????????????????????????????????????????????????????????????????????

function Romberg

  clear;
  clc;

  x1 = [0  2/3*pi  4/3*pi  2*pi];
  x2 = [ 0  pi/2  pi   3/2 * pi   2*pi ];

  h1 = x1(2) - x1(1);
  h2 = x2(2) - x2(1);

  [ys1, ys2] = calculoFuncion1(x1,x2);
  [ysc1, ysc2] = calculoFuncion2(x1,x2);

  inYs1 = trapeciosCompuestos(x1, ys1,h1)
  inYs2 = trapeciosCompuestos(x2, ys2,h2)

  inYsc1 = trapeciosCompuestos(x1, ysc1,h1)
  inYsc2 = trapeciosCompuestos(x2, ysc2,h2)

endfunction
%-------------------------------------------------------------------------------------------------------------------------------------
function [y1, y2] = calculoFuncion1 (x1 , x2)

  y1 = zeros(1, length(x1));
  y2 = zeros(1, length(x2));

  for i = 1:length(x1)

    y1(i) = (sin(x1(i)))^2;

  endfor
  for i = 1:length(x2)

    y2(i) = (sin(x2(i)))^2;

  endfor
endfunction
%-------------------------------------------------------------------------------------------------------------------------------------
function [y1, y2] = calculoFuncion2 (x1 , x2)

  y1 = zeros(1, length(x1));
  y2 = zeros(1, length(x2));

  for i = 1:length(x1)

    y1(i) = sin(x1(i)) * cos(x1(i));

  endfor
  for i = 1:length(x2)

    y2(i) = sin(x2(i)) * cos(x2(i));

  endfor
endfunction
%-------------------------------------------------------------------------------------------------------------------------------------
function int = trapeciosCompuestos(x,y,h)

  sum = 0;

  for i = 2:length(y-1)

    sum = sum + y(i);

  endfor

  int = h/2 * (y(1) + 2*sum + y(length(y)));

endfunction




















