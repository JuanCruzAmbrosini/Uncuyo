%Dada la función f : R -> R en forma discreta, se busca determinar I =  1.1  f(x) 1.5.
%(1.1, 3.0042)  (1.3, 3.2) (1.5, 4.4817)

function MetodoTrapeciosMultiples

  clear;
  clc;

  x = [1.1, 1.3, 1.5];
  y = [3.0042, 3.2, 4.4817];

  mismoPaso = true;
  pasos = zeros(1,length(x)-1);

  for i = 1:length(pasos)

    pasos(i) = x(i+1) - x(1);

  endfor
  for i = i :length(pasos) - 1
    if pasos(i) != pasos(i+1)

      mismoPaso = false;

    endif
  endfor
  if mismoPaso == true

    h = x(2) - x(1);
    sumY = 0;

    for i  = 2:length(y)-1

      sumY = sumY + y(i);

    endfor

    in = (h/2) * ( y(1) + 2 * sumY + y(length(y)));

    disp('El valor aproximado de la integral es: '), in

   else

    disp('El paso no es el mismo.')

  endif
endfunction



















