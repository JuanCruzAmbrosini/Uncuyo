%Considere la función dada por los siguientes datos,
%(0 , 1)  ( 0.1 , 7)  ( 0.2 , 4 )  ( 0.3 , 3 )  ( 0.4 , 5 )
%Usando la regla de Simpson compuesta entre x=0 y x=0.4.

function SimpsonCompuesta

  clear;
  clc;

  x = [0 0.1 0.2 0.3 0.4];
  y = [1 7 4 3 5];

  sumPar = 0;
  sumImpar = 0;

  h = x(2) - x(1);

  j = length(y) - 1;

  for i = 2:j
    if mod( i , 2 ) == 0;

      sumPar = sumPar + y(i);

    elseif mod ( i  , 2) != 0

      sumImpar = sumImpar + y(i);

    endif
  endfor

  in = h/3 * (y(1) + 2 * sumPar + 4 * sumImpar+ y(j+1));

  disp('La integral aproximada mediante el método de Simpson compuesto  es: '), in

endfunction
