%Desarrollar un algoritmo que lea una matriz A(i,j) de orden N. Luego, debe almacenar la "norma
%infinito" de cada fila de la matriz A en un vector denominado NormaFila. Seguidamente, debe
%calcular la norma infinito del vector NormaFila. Finalmente, sólo si este último resultado es cero,
%debe entregar el mensaje "Matriz Nula"; de otra forma, debe entregar el resultado no nulo obtenido
%precedido del mensaje "la norma es".Recordar que la "norma infinito" es la mayor de las
%componentes tomadas en valor absoluto.

function NormaInfinitoMatriz

  clear
  clc

  matriz = 0;
  vectorNormaFila = 0;
  vectorFila = 0;
  normaFila = 0;
  valorVerificador = 0;
  n = input("Ingrese el orden de la matriz:  ");

  for(i = 1:n)
    for(j = 1:n)

      matriz (i,j) = input (['Ingrese la componente ', num2str(i),', ', num2str(j),' de la matriz: '] );

    endfor
  endfor

  for (k = 1:n)

    vectorFila = encontrarVectorFila(matriz,k,n);
    normaFila = calcularNormaInfinito(vectorFila);
    vectorNormaFila(k) = normaFila;

  endfor

  valorVerificador = calcularNormaInfinito(vectorNormaFila);

  if( valorVerificador != 0 )

    disp(['La norma es: ',num2str(valorVerificador)])

   else

    disp("Matriz Nula.")

  endif

endfunction
%-------------------------------------------------------------------------------------------------------
function normaInfinito = calcularNormaInfinito (vector)

  normaInfinito = -Inf;

  for(i = 1 : numel(vector))

    if(abs(vector(i)>normaInfinito))

      normaInfinito = abs(vector(i));

    endif
  endfor

endfunction
%-------------------------------------------------------------------------------------------------------
function vector = encontrarVectorFila(matriz, fila, orden)

vector = 0;

  for(i = 1:orden)

    vector(i) = matriz(fila,i);

  endfor

endfunction

























