%Una estación meteorológica recibe datos de temperatura en cada hora del día. Desarrollar un
%algoritmo que reciba dichos datos, y al final del día encuentre e imprima el valor mínimo y máximo.

function estacionMetereologicaDos

clear
clc

minValue = -15;
maxValue = 49;
sum = 0;
temparaturaMax = -100;
temparaturaMin = 100;

  for(i = 1:24)

    vectorTemperatura(i) = enteroAleatorio = randi([minValue, maxValue]);

  endfor

  for(i = 1:24)

    if(vectorTemperatura(i) > temparaturaMax )

      temparaturaMax = vectorTemperatura(i);

    endif
    if(vectorTemperatura(i) < temparaturaMin )

      temparaturaMin = vectorTemperatura(i);

    endif

  endfor

disp("La temperatura mínima es: "),temparaturaMin
disp("La temperatura máxima es: "),temparaturaMax

  endfunction
