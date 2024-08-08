%Dados los puntos (1,3); (3,7); (5,6), Calcule los valores de la función interpolada en los valores de x = 2, 4, 6 usando multiplicadores de Lagange;

function Lagrange

  clear;
  clc;

  valoresDeX = [0   750];
  valoresDeY  =[0  300];

  puntosDeInterpolacion =0:1:4500;

  cp = 100;
  dx = (valoresDeX(3) - valoresDeX(1))/cp;
  xg = valoresDeX(1):dx:valoresDeX(3);

  n = length(xg);

  px = zeros(n);

  for i = 1:n

    px(i) = (la1(valoresDeX,xg(i)) * 0) + (la2(valoresDeX,xg(i)) * 300 )  ;

endfor
  for i = 1:n

    l1(i) = la1(valoresDeX,xg(i));
    l2(i) = la2(valoresDeX,xg(i));

  endfor

  figure(1);
  plot(xg, l1,'r');
  hold on;
  plot(xg, l2,'b');
  hold on;
  plot(xg, l3,'g');
  hold on;
  plot(xg, px,'y');
  hold on;
  title('Polinomios de Lagrange: ')
  grid on
  legend('Pol. N°1 ', 'Pol N°2 ', 'Pol. N°3 ', 'Polinomio completo ');
  hold on;
  grid on

endfunction
%------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function y = la1(x, abscisa)

  y = 1;
  y = y * ((abscisa - x(2))/(x(1) - x(2)));

endfunction
  %------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function y = la2(x, abscisa)

  y = 1;
  y = y * ((abscisa - x(1))/(x(2) - x(1)));

endfunction
  %------------------------------------------------------------------------------------------------------------------------------------------------------------------------































