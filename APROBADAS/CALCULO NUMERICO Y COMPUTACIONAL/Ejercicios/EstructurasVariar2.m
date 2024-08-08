%Una estaci�n meteorol�gica recibe datos de temperatura en cada hora del d�a. Desarrollar un
%algoritmo que reciba dichos datos, y al final del d�a encuentre e imprima el valor m�nimo y m�ximo.

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

disp("La temperatura m�nima es: "),temparaturaMin
disp("La temperatura m�xima es: "),temparaturaMax

  endfunction
