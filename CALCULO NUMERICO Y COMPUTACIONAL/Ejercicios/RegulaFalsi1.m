%Dada la función f(x) = x^3 - 27 y los intervalos de la variable x, I1 = [1,5; 4] I2 = [4, 6]

function RegulaFalsi

  clear
  clc

  a = 1.5;
  b = 4;
  c = 4;
  d = 6;

  fa = a^3 -27;
  fb = b^3 -27;
  fc = c^3 -27;
  fd = d^3 -27;

  raiz = 0;

  hayRaizIntervalo1 = comprobadorDeIntervalo( fa,fb );
  hayRaizIntervalo2 = comprobadorDeIntervalo( fc,fd );

  if(hayRaizIntervalo1 == true)

  raiz = algoritmoRegulaFalsi(a, b, fa, fb, raiz);
  disp("La raíz está en el primer intervalo.");
  disp(['El resultado es: ',num2str(raiz)]);

  elseif(hayRaizIntervalo2 == true)

  disp("La raíz está en el segundo intervalo.");
  disp(['El resultado es: ',num2str(raiz)]);
  raiz = algoritmoRegulaFalsi(c, d, fc, fd, raiz);

  endif

  x = linspace(-5,5);
  y = x.^3-27;

  plot(x,y,'g');
  title('F(x)');
  xlabel('Eje x');
  ylabel('Eje y');
  grid on;

endfunction
%------------------------------------------------------------------------------------------------------------------------------
function cambiaDeSigno = comprobadorDeIntervalo ( fa, fb )

  cambiaDeSigno = false;

  if (fa * fb < 0)

    cambiaDeSigno = true;

  else

 cambiaDeSigno =  false;

  endif

endfunction
%------------------------------------------------------------------------------------------------------------------------------
function raiz = algoritmoRegulaFalsi( a ,b, fa, fb, raiz )

  it = 1;
  tol = Inf;
  raizAnterior = 0;

  while(it <=100 && tol > 0.05)

  fa = a^3 -27;
  fb = b^3 -27;

   raiz = a - (fa/((fa - fb)/(a-b)));
   tol = abs(raiz - raizAnterior);
   fraiz = raiz^3 -27;

   if( fa * fraiz < 0)

    b = raiz;

   elseif(fb * fraiz < 0)

    a = raiz;

   endif
   raizAnterior = raiz;
   it = it+1;
  endwhile
  disp(['La cantidad de iteraciones es: ',num2str(it)]);
endfunction




































