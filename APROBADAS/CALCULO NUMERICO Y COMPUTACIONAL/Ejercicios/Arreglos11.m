%Desarrollar un algoritmo que lea un vector y una matriz, que realice el producto entre ambos e
%imprima el nuevo vector. Asumir que el orden del vector y la matriz son tales que es posible el
%producto.

function matrizPorVector

  clear
  clc

  matriz = 0;
  vector = 0;

  filas = input("Ingrese la cantidad de filas de la matriz. ");
  columnas = input("Ingrese la cantidad de columnas de la matriz. ");

  for(i = 1:filas)

    for(j = 1:columnas)

      matriz(i,j) = input (['Ingrese la componente ', num2str(i),', ', num2str(j),' de la matriz: '] );

    endfor

endfor

  for(i = 1:2)

    for(j = 1:1)

      vector(i,j) = input (['Ingrese la componente ', num2str(i),', ', num2str(j),' del vector: '] );

    endfor

endfor

matrizProducto = matriz * vector

endfunction
