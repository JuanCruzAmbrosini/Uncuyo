%Desarrollar un algoritmo que lea un vector, obtenga su norma cuadrática y la entregue.

function NormaCuadratica

  clear
  clc

  vector = [5,2,9,6,1,7];
  sum = 0;

  for(i = 1:numel(vector))

    elementoDeLaSuma = vector(i)^2;
    sum = sum + elementoDeLaSuma;

  endfor

  normaCuadratica = (sum)^(1/2);

  disp("La norma cuadrática del vector es: "),normaCuadratica

 endfunction
