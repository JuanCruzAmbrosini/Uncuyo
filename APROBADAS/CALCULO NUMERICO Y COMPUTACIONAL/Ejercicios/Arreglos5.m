%Desarrollar un algoritmo que lea dos vectores, realice su diferencia e imprima los tres vectores.
%Asumir que el orden de los vectores permite realizar la diferencia.

function RestaDeVectores

  clear
  clc

  vector1 = [-12,-14,26,-6,-2,12];
  vector2 = [31,23,-16,41,-5,-10];
  vector3 = 0;

  for (i = 1:numel(vector1))

    vector3(i) = vector1(i) - vector2(i);

  endfor

  disp(""), vector1
  disp(""), vector2
  disp(""), vector3

endfunction

