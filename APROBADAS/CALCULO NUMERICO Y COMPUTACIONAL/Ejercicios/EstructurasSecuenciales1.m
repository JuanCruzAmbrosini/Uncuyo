function Hipotenusa
  clear
  clc

  c1 = input("Ingrese el valor del primer cateto. ");
  c2 = input("Ingrese el valor del segundo cateto. ");

  h = (c1^2 + c2^2)^(1/2);

  disp("La hipotenusa es: ");
  disp(h);

 endfunction
