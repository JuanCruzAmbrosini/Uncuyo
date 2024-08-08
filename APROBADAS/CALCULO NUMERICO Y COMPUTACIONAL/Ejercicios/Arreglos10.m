%Desarrollar un algoritmo que lea e imprima las componentes de una matriz.

function matriz

  clear
  clc

  matriz = 0;

  filas = input("Ingrese la cantidad de filas de la matriz. ");
  columnas = input("Ingrese la cantidad de columnas de la matriz. ");

  for(i = 1:filas)

    for(j = 1:columnas)

      matriz(i,j) = input (['Ingrese la componente ', num2str(i),', ', num2str(j),' de la matriz: '] );

    endfor

  endfor

disp("La matriz ingresada es: ")
disp(matriz);

endfunction
