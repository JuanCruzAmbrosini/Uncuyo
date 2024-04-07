% Dada la función f : R? R en forma discreta, se busca determinar algunas derivadas en puntos xi. Sea
% la función:
% ( 0.8  ,  2.5537129 ) ( 0.9  ,  2.78927897 ) ( 1  ,  3)  ( 1.1  ,  3.19062036 ) ( 1.2  ,  3.36464311 )
%    a)  Calcule una aproximación de la derivada primera de la f(x) en x=0.8. Elija una fórmula de
%          derivación según los datos que tiene. Use el paso h1 que sea el menor posible.    0.106  -8.9430e-03  -0.012180  -0.014046

%{
function DerivadaHaciaAdelante

 clear;
  clc;

  x = [0.8  0.9  1  1.1  1.2];
  y = [ 2.5537129  2.78927897  3  3.19062036  3.36464311 ];

  h = x(2) - x(1);
  der = (1/h) * (y(2) - y(1))

  h2 = x(3) - x(1);
  der2 = (1/h2) * (y(3) - y(1))

  B = (h/h2);

  derDef = (B * der2 - der)/(B -1)

endfunction
%}
%----------------------------------------------------------------------------------------------------------------------------------

function DerivadaCentral

 clear;
  clc;

  y = [ 0.4770    0.2337  0];

  h = 100/6

  der = (1/(2*h)) * (y(3) - y(1))

endfunction

%----------------------------------------------------------------------------------------------------------------------------------
%{
function DerivadaDeCincoPuntos

  clear;
  clc;

  x = [0.8  0.9  1  1.1  1.2];
  y = [ 2.5537129  2.78927897  3  3.19062036  3.36464311 ];

  h = x(4) - x(3)

  der = 1/h * ((1/12 * y(1)) - (2/3 * y(2) )+ (2/3 * y(4)) - (1/12 * y(5)))

endfunction
%}
%----------------------------------------------------------------------------------------------------------------------------------
%{
function DerivadaAsimetricaAdelante

  clear
  clc

  y = [ 1.0390 1.0000 0.8830]
  h = 100/6
  der = (1/h) * (-3 * y(1) + 4 * y(2) +y(3) )

endfunction
%}
%----------------------------------------------------------------------------------------------------------------------------------
%{
function DerivadaAsimetricaAtras

  y = [ 2.5537129  2.78927897  3  3.19062036  3.36464311 ];
   der = 1/h * (3 * y(3) - 4 * y(2) + y (1));

endfunction
%}




























