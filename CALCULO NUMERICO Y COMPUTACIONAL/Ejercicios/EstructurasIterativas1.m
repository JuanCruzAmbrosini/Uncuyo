%Desarrolle un algoritmo para leer n�meros reales, sumarlos y detenerse s�lo cuando lea un cero.
%Imprima los resultados.

function NumerosRealesMenosCero

clear
clc

controlDeInicio = true;
sum = 0;

  while (controlDeInicio == true)

    n = input("Ingrese un n�mero: ");

    if(n == 0)

      disp("Se ha ingresado un 0 y el algoritmo se detendr�.")
      controlDeInicio = false;
      break;

    else

      sum = n + sum;

    endif

  disp("La suma hasta ahora es: "),sum
  disp("Para finalizar el algoritmo, ingrese un 0.")

  endwhile

endfunction
