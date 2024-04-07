% (dy/dx) + A * y = 0                                    aER
% y (x0) = y0
% x = 0.6;  A = 1;  (x0, y0) = (0 , 10); h = 0.1

% f(x,y) = -A*y

function EulerHaciaAdelante

  clear;
  clc;

  x1 = [0 0.1  0.2  0.3  0.4  0.5  0.6];
  y1 = eulerHaciaAdelanteMetido(x1);
  h1 = x1(2) - x1(1);


  x2 = [0  0.3 0.6];
  y2 = eulerHaciaAdelanteMetido(x2);
  h2 = x2(2) - x2(1);


  x3 = [0  0.6];
  y3 = eulerHaciaAdelanteMetido(x3);
  h3 = x3(2) - x3(1);


  r1 = richardson(y1(length(y1)), y2(length(y2)), h1, h2);
  r2 = richardson(y2(length(y2)), y3(length(y3)), h2, h3);

  rn1 = richardson2(r1,r2)

  disp('La mejor aproximación (después de aplicar el metodo de extrapolación de Richardson) en x = 0.6 es: '), r2
endfunction
%-------------------------------------------------------------------------------------------------------------
function f = evaluarFuncion (y)

  f = 1*y;

endfunction
%-------------------------------------------------------------------------------------------------------------
function y = eulerHaciaAdelanteMetido (x)

  y = zeros(1, length(x));
  h = x(2) - x(1);

  x0 = 0;
  y0 = 10;
  y(1) = y0;

  for i = 1:length(x)-1

    y(i+1) = y(i) + h * evaluarFuncion(y(i));

  endfor

  disp('Los valores aproximados de y con un paso de 0.1 son: '),y

  figure(1)
  plot(x,y,'b');

endfunction
%-------------------------------------------------------------------------------------------------------------
function af = richardson(a1,a2,h1,h2)

  B = (h1/h2)^2;

  af = (B*a2 - a1)/(B-1);

endfunction
%-------------------------------------------------------------------------------------------------------------
function af = richardson2(a1,a2)

  af = (4 * a2 - a1)/3;

endfunction









