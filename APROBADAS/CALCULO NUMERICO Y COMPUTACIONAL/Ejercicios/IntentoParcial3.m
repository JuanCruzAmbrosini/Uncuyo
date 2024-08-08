function IntentoParcial3

  clear;
  clc

   t0 = 0;
   tf = 4500;
   dt = 10;
   K = 1/50 * [  -2 1 0 0 0 0;
                            1 -2 1 0 0 0;
                            0 1 -2 1 0 0;
                            0 0 1 -2 1 0;
                            0 0 0 1 -2 1;
                            0 0 0 0 2/3 -2/3 ];
   p = 1/50*[1;0;0;0;0;0];
   z0 = zeros(6,1);
   t0 = 0;
   td = 750;
   w=0.5 ;

   it = 0;

   for t = t0:dt:tf

     it = it+1;
     dz = calcularDerivada(K,z0,p,t,td);
     k1 = dt * dz;
     tg = t0 + dt/(2*w);
     zg = z0 + k1/(2*w);
     dzg = calcularDerivada(K,zg,p,t,td);
     k2 = dt * dzg;

     Mz(:,it) = z0;
     vt(it) = t;

     z0 = z0 + (1-w)*k1 + w*k2;

   endfor
   figure(1)
   plot(vt,Mz(3,:) )

  tk = tf/2;
  zk = Mz( : , tk/dt -1 );
  xf = 1.7;
  x0 = 1;

  dx = (xf-x0)/7;
  x = zeros (8, 1);
  y = zeros (8, 1);
  y(1) = g(td, tk);
  y(8) = (4*zk(6) -zk(5))/3;
  x(1) = 1;
  for i = 2: 8

    x(i) = x(i-1) + dx;

    if  i < 8

      y(i) = zk(i-1);

    endif
  endfor

  figure(2)
  plot(x, y, 'g')

  vd = zeros(8,1);
  vd(1) = derivadaAsimetricaAdelante(dx, y);
  vd(8) = derivadaAsimetricaAtras(dx, y);
  for i = 2:7

    vd(i) = 1/(2*dx) * ( y(i+1) - y(i-1));

  endfor

  figure(3)
  plot(x,vd,'r')

  vdc = zeros(8,1);

  for i = 1:8

    vdc(i) = vd(i).^2;

endfor

  I = trapeciosCompuestos(dx, vdc);

  phi = calculoPhi(x);

  mc = phi' * phi;
  mr = phi' * y;

  GS3=inv(phi'*phi)*(phi'*y);

   cp = 100;
   xmc = x(1):dx:x(8);
   pmc = zeros(1,length(xmc));

  for i = 1:length(xmc);

    pmc(i) = GS3(1) + GS3(2) * (1/xmc(i)) + GS3(3) * (1/xmc(i)^2 );

  endfor

  figure(4);
  plot(xmc,pmc,'r', x,y, 'db')
  title('Aproximacion lineal mediante el método de minimos cuadrados.')
  grid on;

endfunction
%--------------------------------------------------------------------------------
function g = g(td, t)

  if t < td

    g = t/td *300;

  else

    g = 300;

  endif

endfunction
%--------------------------------------------------------------------------------
function d = calcularDerivada(K,z,p,t,td)

  d = K * z + p* g(td,t);

endfunction
%--------------------------------------------------------------------------------
function d = derivadaAsimetricaAdelante(dt, y)

  d = 1/(2*dt) * ( -3 * y(1) + 4*y(2) - y(3));

endfunction
%--------------------------------------------------------------------------------
function d = derivadaAsimetricaAtras(dt, y)

  n = length(y);

  d = 1/(2*dt) * ( 3 * y(n) - 4*y(n-1) + y(n-2));

endfunction
%--------------------------------------------------------------------------------
function I = trapeciosCompuestos(dx, y)

  n = length(y);
  sum = 0;

  for i = 2:n-1

    sum = sum + y(i);

  endfor

  I = dx/2 * ( y(1) +2 * sum + y(n) );

endfunction
%--------------------------------------------------------------------------------
function phi = calculoPhi (x)

  n = length(x);
  phi = zeros(n,3);

  for i = 1:n
    for j = 1:3

      phi(i,j) = 1/((x(i))^(j-1));

    endfor
  endfor
endfunction
%--------------------------------------------------------------------------------
function x = GaussSeidel ( A, b)

  n = length(b);
  x = zeros( n, 1 );
  xOld = zeros( n, 1 );
  tol = Inf;
  it = 0;

  while tol >0.00000005 && it < 100000
  for i = 1:n

    sum = 0;

      for j = 1:n
        if i != j
          if j<i

            sum = sum + A(i,j)*x(j);

          elseif j>i

            sum = sum + A(i,j) * xOld(j);

          endif
        endif
      endfor

      x(i) = (-sum + b(i))/A(i,i);
      e(i) = abs((x(i) - xOld(i))/x(i));

    endfor

    xOld = x;
    tol = max(e);
    it = it +1;

 endwhile
 it
endfunction

























