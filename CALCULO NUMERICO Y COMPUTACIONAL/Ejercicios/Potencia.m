function sacarAutovectores

  clc
  clear

  tol = Inf;
  it = 0;
%Declaración de variables.
  A = [1,2,3;4,5,6;7,8,9];
  y = randi([0, 50], 3, 1);
  x = y/norm(y);
  eingevector = zeros(3,1);
  valorPropioAnterior = 0;


  while it < 15 && tol > 0.0001
%Calculos iterativos
    eingevector = A * x;
    eingevector = eingevector/norm(eingevector);
    valorPropio = norm(A * eingevector)/norm(eingevector);
%Control de detención
    tol = abs(valorPropio - valorPropioAnterior);
%Actualización de variables
  valorPropioAnterior = valorPropio;
   x = eingevector;
   it = it +1;

endwhile
%Muestra de resultados
  valorPropio
  eingevector
  it

endfunction
