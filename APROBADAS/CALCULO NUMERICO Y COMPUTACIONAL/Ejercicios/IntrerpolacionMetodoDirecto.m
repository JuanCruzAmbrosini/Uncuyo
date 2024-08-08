%Para la función discreta y=f(x) definida con los siguientes dos puntos (3,5) , (7,-1)

function MetodoDirecto

clear;
clc;
  xValues = [1.5,3,4.5];
  A = matrizDeCoeficientes(xValues)
  B = [3 ; 4;3.5];

  coefPolin  = GaussSeidel(A,B);

  disp(['Los coeficientes del polinomio son: ']), coefPolin
endfunction
%---------------------------------------------------------------------------------------
function A = matrizDeCoeficientes(x_values)

    n = length(x_values);
    A = zeros(n, n);

    for i = 1:n

        x = x_values(i);

        for j = 1:n

            phi = x^(j-1);
            A(i, j) = phi;

        endfor
    endfor
endfunction
%---------------------------------------------------------------------------------------
function x = GaussSeidel(A,B)

  n = rank(A);
  tol = Inf;
  it = 0;
  x = zeros(n,1);
  xOld = zeros(n,1);
  e = zeros(n,1);

  while tol > 0.00005 && it < 100

    it = it +1;

    for i = 1:n

      sum = 0;

      for j = 1:n

        if j!=i

          if j<i

            sum = sum + A(i,j)* x(j);

          elseif i<j

            sum = sum + A(i,j) * xOld(j);

          endif
        endif
      endfor

      x(i) = (-sum + B(i) )/A(i,i);
      e(i) = abs ( x(i) - xOld (i) );

    endfor

    xOld = x;
    tol = max(e);

endwhile

it
endfunction




























