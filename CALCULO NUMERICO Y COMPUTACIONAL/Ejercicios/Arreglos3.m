%Desarrollar un algoritmo que lea un vector, obtenga la norma infinito (valor absoluto máximo) del
%vector y la entregue.

function NormaInfinito

  clear
  clc

  vector = [-12,1,3,-6,-2,-9];

  disp("La norma infinito del vector es: "), encontrarNormaInfinito(vector)

endfunction

function normaInfinito = encontrarNormaInfinito(vector)

  normaInfinito = -10000;

  for(i = 1:numel(vector))

    if (normaInfinito < abs(vector(i)))

      normaInfinito = abs(vector(i));

    endif

  endfor

endfunction
