function InterpolacionNewton

  clear;
  clc;

  x = [0, pi/4, pi/2, 3*pi/4];
  y = [0, (2^(1/2))/2, 1, (2^(1/2)/2)];

  n = length(x);

  dd = zeros(n, n);
  a = zeros(1,n);
  ni = ones(1,n);
  np = 100;
  dx = (x(4) - x(1))/np;
  xg = x(1):dx:x(4);

  N = length(xg);

  for j = 1:n
    for i = 1:n
        if j == 1

          dd(i,j) = y(i);

        elseif (j == 2 && i < n)

          dd(i +1,j) = ( dd(i + 1,j - 1) - dd( i , j - 1) )/( x(i+1) - x(i) );

         elseif j == 3 && i < n - 1

           dd(i +2,j) = ( dd(i + 2,j - 1) - dd( i + 1 , j - 1) )/( x(i + 2) - x(i) );

         elseif j == 4 && i <= n - 3

           dd(i +3,j) = ( dd(i + 3,j - 1) - dd( i + 2 , j - 1) )/( x(i + 3) - x(i ) );

        endif
    endfor
  endfor

 for i = 1:n
   for j = 1:n
     if i == j

       a(i) = dd(i,j);

     endif
   endfor
 endfor


for j=1:N
n1(j)=1; %Obtinen el polin de Newton n1
n2(j)=n1(j)*(xg(j)-x(1)); %Obtinen el polin de Newton n2
n3(j)=n2(j)*(xg(j)-x(2)); %Obtinen el polin de Newton n3
n4(j)=n3(j)*(xg(j)-x(3)); %Obtinen el polin de Newton n4
% Obtiene el Polinomio de Interpolacion con Polin de Newton
P(j)=a(1)*n1(j)+a(2)*n2(j)+a(3)*n3(j)+a(4)*n4(j);
endfor

  figure(1);
  plot(xg,P,'b',x,y,'db');
  title('Polinomio de Newton');
  grid on;


endfunction
%--------------------------------------------------------------------------------------------------------------------------------------------------------------
function ni = calcularLosN (x, valoresX, valoresY)

  ni(1) = 1;
  ni(2) = ni(1)*(x-valoresX(1));
  ni(3) = ni(2)*(x-valoresX(2));
  ni(4) = ni(3)*(x-valoresX(3));

endfunction



https://meet.google.com/tej-smrc-asn

















