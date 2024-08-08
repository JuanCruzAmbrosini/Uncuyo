%Desarrollar un algoritmo que lea una matriz A(i,j) de orden N y genere otra matriz Triangular Inferior
%TS(i,j) con la siguiente característica:
%a) cuando j es mayor que i, los elementos TS(i,j) deben ser 0;
%b) cuando i es mayor a j los elementos TS(i,j) son iguales a A(i,j)/A(i,i);
%c) los elementos de la diagonal de T(i,j) son iguales a 1

function MatrizTriangularInferior

  clear
  clc

  matriz = 0;
  matrizTriangularSuperior = 0;
  n = input("Ingrese el orden de la matriz:  ");

  for(i = 1:n)

    for(j = 1:n)

      matriz (i,j) = input (['Ingrese la componente ', num2str(i),', ', num2str(j),' de la matriz: '] );

    endfor

  endfor

  for(i = 1:n)

    for(j = 1:n)

        if(j > i)

          matrizTriangularSuperior(i,j) = 0;

        elseif(i > j)

          matrizTriangularSuperior(i,j) = matriz(i,j)/matriz(i,i);

         elseif(i = j)

          matrizTriangularSuperior(i,j) = 1;

        endif

    endfor

  endfor
disp ("Matriz original: ");
disp(matriz);
disp("Matriz triangular inferior: ");
disp(matrizTriangularSuperior);

endfunction

