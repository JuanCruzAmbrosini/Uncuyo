%Dada la funcion f : R -> R en forma discreta, se busca determinar I =  1.1  f(x) 1.5.
%(1.1, 3.0042)  (1.5, 4.4817)

function TrapeciosSimples

  clear;
  clc;

  x = [ 0 , 0.4 ];
  y = [1, 5];

  h = x(2) - x(1);

  intAprox = h*( (y(1)/2) + (y(2)/2) );
  disp('Una integral aproximada es: '), intAprox

    % Graficar los puntos y la línea entre ellos
  figure;
  plot(x, y, 'o-b', 'LineWidth', 2, 'MarkerSize', 8);
  hold on;
  fill([x, fliplr(x)], [zeros(1,2), fliplr(y)], 'cyan', 'FaceAlpha', 0.3, 'EdgeColor', 'none'); % sombra del área
  xlabel('x');
  ylabel('f(x)');
  title('Aproximación de la integral con la regla del trapecio');
  grid on;
  legend('Puntos dados','Área aproximada');


endfunction
