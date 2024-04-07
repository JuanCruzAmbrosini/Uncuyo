function PruebaFinalDefinitivo

  clear;
  clc;

  L = 50000;
  EA = 21E4;
  PA = 8E-9;
  Ml = 1.02E-2;
  dx = 10000;

  K =  -EA/dx^2 *  [-2 1 0 0 0; 1 -2 1 0 0; 0 1 -2 1 0; 0 0 1 -2 1; 0 0 -1 2*dx -3/2*dx]
  M = [PA 0 0 0 0; 0 PA 0 0 0; 0 0 PA 0 0; 0 0 0 PA 0; 0 0 0 0 -(dx^2/EA)*Ml]

endfunction
%---------------------------------------------------------------------------------------------------------------
function g = g(t)

    td = 1;

    if t <= td

      g = (t^2-td*t)/(((td^2)/4)-(td^2)/4);

    elseif t > td

      g = 0;

    endif
 endfunction
