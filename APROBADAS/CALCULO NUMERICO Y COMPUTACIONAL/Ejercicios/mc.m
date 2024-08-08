function minimosCuadrados

  clear;
  clc;

  x0 = 1;
  xf = 1.7;
  dx = 0.1;
  y = [1;221.0171;161.8879;117.2008;85.0381;63.4547;51.0327;0];
  it = 1;
  a = [-2070.2; 5443.6; -3325.5];

  x = x0:dx:xf;

  phi = phi(x);

  p = phi * a

  phi
  x

  plot(x,y,'o')
  hold on
  plot(x,p,'r')
  hold off
endfunction
%---------------------------------------------------------------------------
function phi = phi(x)

  for i = 1:3

    phi( : , i ) = 1/(x(:).^i-1);

  endfor

endfunction
