%Encontrar la raíz de la función f(x) = x^3 - 27. Se tienen los valores
%obtenidos con el método de bisección x= 2,5 y 2,75.

function Secante

  clear
  clc

  r1 = 2.5;
  r2 = 2.75;

  fr1 = fx(r1);
  fr2 = fx(r2);

  metodoSecante(r1, r2, fr1, fr2);

  x = linspace(-5,5,100);
  y = x.^3 - 27;

  plot(x,y,'g');
  title('y = x^3 - 27');
  xlabel('Eje X');
  ylabel('Eje Y');
  grid on;

endfunction
%------------------------------------------------------------------------------------------------------------------------------
function fc = fx (x)

  fc = x^3 - 27;

endfunction
%------------------------------------------------------------------------------------------------------------------------------
function metodoSecante (r1, r2, fr1, fr2)

  tol = Inf;
  it = 0;
  raiz = 0;
  while ( it < 100 && tol > 0.05 )

    raiz = r1 -(fr1/((fr1 - fr2)/(r1 - r2)))
    r1 = r2;
    r2 = raiz;
    fr1 = fx(r1);
    fr2 = fx(r2);
    tol = abs(r2 -r1);
    it = it + 1;

  endwhile

  disp(['La cantidad de iteraciones fueron: ', num2str(it)]);
  disp(['El resultado es: ',num2str(raiz)]);
endfunction

