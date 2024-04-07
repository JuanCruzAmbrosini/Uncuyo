%Desarrollar un algoritmo que lea un vector e imprima el versor unitario que indica la dirección del
%vector dato.

function VectorUnitario

  clear
  clc

  vector = [1,2];

  disp("El vector normalizado es: "),calcularNormaDeVector(vector)

endfunction

function vectorNormalizado = calcularNormaDeVector(vector)

  normaCuadratica = 0;
  vectorNormalizado = 0;
  sumaDeLosCuadrados = 0;

  for(i = 1:numel(vector))

    elementoDeLaSuma = vector(i)^2;
    sumaDeLosCuadrados = sumaDeLosCuadrados + elementoDeLaSuma;

  endfor

  normaCuadratica  = sumaDeLosCuadrados^(1/2);

  for(i = 1:numel(vector))

    vectorNormalizado(i) = vector(i)/normaCuadratica;

  endfor

endfunction
