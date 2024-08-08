%Considere la función dada por los siguientes datos,
%(0 , 1)  ( 0.1 , 7)  ( 0.2 , 4 )  ( 0.3 , 3 )  ( 0.4 , 5 )
%Usando la regla de Simpson simple entre x=0 y x=0.4

function Simpson

  clear;
  clc;

  x = [0 , 0.2 , 0.4];
  y = [1 , 4 , 5];

  h = x(3) - x(2);

  in = h*(1/3 * y(1) + 4/3 * y(2) + 1/3 * y(3));

  disp('La integral aproximada por el método de Simpson es: '),in

endfunction
