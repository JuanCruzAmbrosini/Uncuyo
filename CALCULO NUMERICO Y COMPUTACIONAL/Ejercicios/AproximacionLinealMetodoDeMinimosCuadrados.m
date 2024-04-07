%Aproxime según el criterio de mínimos cuadrados, utilizando aproximación lineal, los siguientes
%puntos, cuyas coordenadas son:
% (0,1)  (1,1)  (2,2)  (3,4)

function MinimosCuadradosAproximacionLineal

  clear;
  clc;

  valoresX = [0 0 1 2 3 ];
  valoresY = [1; 2; 2; 3; 3];
  phi = matrizPhi(valoresX);

  matrizResultados = matrizResultados(phi,valoresY);
  matrizCoeficientes = phi' * phi;

  coeficientesA = metodoGaussSeidel(matrizCoeficientes, matrizResultados)

  cp = 100;
  dx = (valoresX(5)-valoresX(1))/cp;
  xg = valoresX(1):dx:valoresX(5);

  for i = 1:(length(xg))
    p(i) = coeficientesA(1) + coeficientesA(2) * xg(i);
  endfor

  figure(1);
  plot(xg,p,'r', valoresX,valoresY, 'db')
  title('Aproximacion lineal mediante el método de minimos cuadrados.')
  grid on;

endfunction
%----------------------------------------------------------------------------------------------------------------------------------------------------------
function phi = matrizPhi(valoresX)

  n = length(valoresX);

  phi = zeros(n,2);

  for i = 1:n
    for j = 1:2

      phi(i,j) = valoresX(i)^(j-1);

    endfor
  endfor

  phi;

endfunction
%----------------------------------------------------------------------------------------------------------------------------------------------------------
function x = metodoGaussSeidel (A,y)

  n = rank(A);
  it = 0;
  tol = Inf;

  x = zeros(rank(A), 1);
  xOld = zeros(rank(A), 1);
  e = zeros(1,n);

  while tol > 0.00005 && it < 50
    for i = 1:n
      sum = 0;
     for j = 1:n
       if j != i
         if j < i

           sum = sum + A(i,j)*x(j);

           elseif j > i

           sum = sum  + A(i,j) * xOld(j);

          endif
       endif
     endfor

     x(i) = (-sum + y(i))/A(i,i);
     e(i) = abs(x(i) - xOld(i));

    endfor

    xOld = x;
    it = it +1;

    tol = norm(e);

endwhile
endfunction
%----------------------------------------------------------------------------------------------------------------------------------------------------------
function M = matrizResultados(phi, y)

  M = phi' * y;

endfunction
%----------------------------------------------------------------------------------------------------------------------------------------------------------
























