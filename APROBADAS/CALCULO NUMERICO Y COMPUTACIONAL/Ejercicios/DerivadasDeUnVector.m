function DerivadasDeUnVector

clear;
clc;
  y = [1.0390 1.0000 0.8830 0.70190 0.4770 0.2337 0];

  h = 100/6;

  der = zeros (1,7);

  for i =1:length(y)
    if i == 1

      der(i) = derivadaAsimetricaAdelante(y,h);

    elseif i > 1 && i < 7;

      der(i) = derivadaCentral(y,h,i);

    else

      der(i) = derivadaAsimetricaAtras(y, h);

    endif

  endfor

  der

endfunction
%----------------------------------------------------------------------------------------------------------------------------------
function der = derivadaAsimetricaAdelante (y, h)

  der = (1/(2*h)) * (-3*y(1) + 4*y(2) - y(3)) ;

endfunction
%----------------------------------------------------------------------------------------------------------------------------------
function der = derivadaAsimetricaAtras (y, h)

  der = (1/(2*h)) * (3*y(7) - 4*y(6) + y(5)) ;

endfunction
%----------------------------------------------------------------------------------------------------------------------------------
function der = derivadaCentral (y, h, i)

    der = ((1/(2*h)) * ((y(i+ 1) - y(i - 1))));


endfunction
