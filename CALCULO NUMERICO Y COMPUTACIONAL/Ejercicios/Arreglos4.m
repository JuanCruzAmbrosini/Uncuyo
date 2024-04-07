%Desarrollar un algoritmo que lea un vector e imprima otro vector que sea paralelo al vector dato pero
%con norma infinito uno. Es decir, el vector normalizado según la norma infinito.

function VectorParalelo

  clear
  clc

  vector = [-12,-14,26,-6,-2,12];
  normaInfinito = encontrarNormaInfinito(vector);

  disp("El vector normalizado es: "), encontrarVectorParaleloNormalizado(vector,normaInfinito)

endfunction

function normaInfinito = encontrarNormaInfinito(vector)

  normaInfinito = -10000;

  for(i = 1:numel(vector))

    if (normaInfinito < abs(vector(i)))

      normaInfinito = abs(vector(i));

    endif

  endfor

endfunction

function vectorParalelo = encontrarVectorParaleloNormalizado(vector,normaInfinito)

  vectorParalelo = 0;

  for(i = 1:numel(vector))

    vectorParalelo(i) = vector(i)/normaInfinito;

  endfor

endfunction
