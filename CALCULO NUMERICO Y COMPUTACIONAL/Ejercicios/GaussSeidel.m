function GaussSeidel

  clear
  clc

  A = [8,6,9;
           5,3,2;
           1,6,4];
  b = [4;9;6];


  tol = Inf;
  it = 0;
  n = rank(A);
  x = zeros(n,1);
  xOld = zeros(n,1);
  e = zeros(n,1);

  while tol > 0.000005 && it < 100

    for i = 1:n

      sum = 0;

      for j = 1:n

        if j != i

          if j < i

            sum = sum + A(i,j) * x(j);

          elseif j > i

            sum = sum + A(i,j) * xOld(j);

          endif
        endif
      endfor

      x(i) = (-sum + b(i))/A(i,i);
      e(i) = abs(x(i) - xOld(i));

    endfor

   tol = max(e);
  xOld = x;
  it = it +1;

  endwhile

  disp('La solucion es: '),x
  disp('El error estimado es de: '), tol
  disp('La cantidad de iteraciones es de: '),it

endfunction






















