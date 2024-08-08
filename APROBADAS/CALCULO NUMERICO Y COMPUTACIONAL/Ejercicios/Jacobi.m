%        [ -3    1  -2]
% A = [   4  -5   0]
%        [   1   -3   6]
%
% B = [-2  5  6]

function Jacobi

  clear;
  clc;
  tol = Inf;
  it = 0;

  A = [-3, 1, -2; 4, -5, 0; 1, -3, 6];
  B = [-2;  5;  6];
  n = rank(A);

 D = matrizD(A);
 R = matrizR(A);

 X0 = zeros(n,1);
 X = zeros(n,1);

 while it < 200 && tol > 0.005

   X = -inv(D)*R*X0 + inv(D)*B;

   tol = abs( ( calcularNormaInfinito(X) - calcularNormaInfinito(X0) ) / calcularNormaInfinito(X));

   X0 = X;

   it = it +1;
 endwhile

  disp("La matriz solución es: "),X
  disp("La cantidad de iteraciones es de: "),it

endfunction
%------------------------------------------------------------------------------------------------
function D = matrizD(A)

  n = rank(A);
  D = zeros(n);

  for i = 1:n

    for j = 1:n

      if i = j

        D(i,j) = A(i,j);

      endif

    endfor

  endfor

endfunction
%------------------------------------------------------------------------------------------------
function R = matrizR(A)

  n = rank(A);
  R = zeros(n);

  for i = 1:n

    for j = 1:n

      if i != j

        R(i,j) = A(i,j);

      endif

    endfor

  endfor

endfunction
%------------------------------------------------------------------------------------------------
function norma = calcularNormaInfinito(vector)

  norma = -Inf;

  for i = 1:rank(vector)

    if ( abs(vector(i)) > norma )

      norma = abs(vector(i));

    endif

  endfor

endfunction


























