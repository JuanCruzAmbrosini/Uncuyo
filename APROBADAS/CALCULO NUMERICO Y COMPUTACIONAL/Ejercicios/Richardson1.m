%Dada la siguiente función y=f(x) en forma discreta, aplicando la regla de trapecios compuesta halle
%una aproximación de la integral de f(x) entre x0 y x4.
%(0 , 1)  ( 1/4 , 3)  ( 1/2 , 3 )  ( 3/4 , 1.5 )  ( 1 , 0 )
%    a) usando un paso h1=0.5 (el intervalo se divide en 2 subintervalos).
%    b) Usando un paso h2=0.25 (el intervalo se divide en 4 subintervalos).
%    c) Mejore la aproximación lograda en los incisos anteriores usando la Regla de Richardson que, a
%        partir de dos valores aproximados con error de orden hn, mejora la aproximación haciendo:

function Richardson1

  clear;
  clc;

  x1 = [0 1/2 1];
  y1 = [1  3  0];


  x2 = [0 1/4  1/2  3/4  1];
  y2 = [1  3  3  1.5  0];

  I1 = trapeciosCompuestos( x1, y1);
  I2 = trapeciosCompuestos( x2, y2);

  h1 = (x1(2) - x1(1) );
  h2 = (x2(2) - x2(1) );

  B = (h1/h2)^2;

  I = (B*I2 -I1)/(B-1);

  disp(['La integral mejor aproximada es: ', num2str(I)]);

endfunction
function in = trapeciosCompuestos( x, y )

  h = x(3) - x(2);

  sum = 0;

  for i = 2: length(y) - 1

    sum = sum + y(i);

  endfor

  in = h/2 * (y(1) + sum + y (length(y)));

  disp(['La integral interpolada de paso ', num2str(h), ' es: ', num2str(in)]);

endfunction
