%Una estación meteorológica recibe datos de temperatura en cada hora del día, durante cada mes.
%Desarrollar un algoritmo que reciba dichos datos, y al final del día calcule el valor medio diario y del
%mes hasta ese momento e imprima los resultados.

function estacionMetereologicaTres

clear
clc

crearVectorAnio();

endfunction
%--------------------------------------------------------------------------------------
function prom = calcularPromedio (vectorTemperatura, n)

  sum = 0;

  for(i = 1:n)

    sum = sum + vectorTemperatura(i);

  endfor

  prom = sum/n;

endfunction
%--------------------------------------------------------------------------------------
function vectorTemperaturaHora = crearVectorDia

  minValue = -15;
  maxValue = 49;

  for(i = 1:24)

    vectorTemperaturaHora(i) = enteroAleatorio = randi([minValue, maxValue]);

endfor

endfunction
%--------------------------------------------------------------------------------------
function vectorTemperaturaDia = crearVectorMes

  for(i = 1:30)

    vectorTemperaturaHora = crearVectorDia();

    prom = calcularPromedio(vectorTemperaturaHora, 24);

    vectorTemperaturaDia(i) = prom;

endfor

endfunction
%--------------------------------------------------------------------------------------
function crearVectorAnio

disp("Promedio de todos los días: ")

  for (i = 1:12)

    vectorTemperaturaMes = crearVectorMes;
    disp("--------------------------------------------------------------------------------------")
    disp("Mes N°: "),i
    disp(vectorTemperaturaMes);
    disp("--------------------------------------------------------------------------------------")
    prom = calcularPromedio(vectorTemperaturaMes, 30);
    vectorMes(i) = prom;

endfor

disp("Promedio de los meses en el año: ")
disp(vectorMes);

endfunction
%--------------------------------------------------------------------------------------








