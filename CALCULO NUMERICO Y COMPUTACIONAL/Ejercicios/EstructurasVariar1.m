%Una estación meteorológica recibe datos de temperatura en cada hora del día. Desarrollar un
%algoritmo que reciba dichos datos, y cada vez que los recibe calcule el valor medio e imprima los
%resultados.

function estacionMetereologica

clear
clc

minValue = -15;
maxValue = 45;
sum = 0;

  for(i = 1:24)

    vectorTemperatura(i) = enteroAleatorio = randi([minValue, maxValue]);

  endfor

  for(i = 1:24)

    sum = sum + vectorTemperatura(i);

  endfor

prom = sum/24;

disp("El promedio despues de 24 horas es: "),prom

  endfunction
