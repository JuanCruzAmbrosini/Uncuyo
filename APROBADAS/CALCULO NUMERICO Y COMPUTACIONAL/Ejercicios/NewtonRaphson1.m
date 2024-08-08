%Se pretende encontrar las raíces de la siguiente función no lineal:
% y = x^2 + 6x -27
function NewtonRaphson

  clear
  clc

  x0 = 70;
  metodoDeNewtonRaphson(x0);

  x = linspace(-5,5,100);
  y = y = x.^2 + 6*x -27;

  plot(x,y,'g');
  title('y = x^2 + 6x -27');
  xlabel('Eje x');
  ylabel('Eje y');

  grid on;

endfunction
%--------------------------------------------------------------------------------------------
function [f,df] = funcionYDerivada (x)

  f = x^2 + 6*x - 27;
  df = 2*x +6;

endfunction
%--------------------------------------------------------------------------------------------
function metodoDeNewtonRaphson (x0)

  tol = Inf;
  it = 0;
  raiz = 0;

  while (it < 20 && tol > 0.05)

    [fx,dfx] = funcionYDerivada(x0);
    raiz = x0 - (fx/dfx);

    tol = abs (raiz - x0);

    x0 = raiz;

    it = it +1;

  endwhile

  disp(['La cantidad de iteraciones es de: ', num2str(it)]);
  disp(['La raíz de la ecuación es el valor:  ', num2str(raiz)]);
  disp(['La derivada de la función, evaluada en el la raíz es de: ', num2str(dfx)])

endfunction
