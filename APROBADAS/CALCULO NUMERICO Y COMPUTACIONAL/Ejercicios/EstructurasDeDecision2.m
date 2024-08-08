%Elaborar un algoritmo que lea cuatro datos y determine cual es el menor. Imprima el resultado

function MenorDato

  clear
  clc

  dato1 = input("Ingrese el primer dato: ");
  dato2 = input("Ingrese el segundo dato: ");
  dato3 = input("Ingrese el tercer dato: ");
  dato4 = input("Ingrese el cuarto dato: ");

  if (dato1 > dato2 && dato1 > dato3 && dato1 && dato4)

    disp("El dato más grande es: "),dato1

    elseif(dato2 > dato1 && dato2 > dato3 && dato2 > dato4)

    disp("El dato más grande es: "),dato2

    elseif(dato3 > dato1 && dato3 > dato2 && dato3 > dato4)

    disp("El dato más grande es: "),dato3

    elseif (dato4 > dato1 && dato4 > dato2 && dato4 > dato3)

    disp("El dato más grande es: "),dato4

  endif

  endfunction
