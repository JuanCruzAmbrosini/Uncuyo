function Abscisas
  clear
  clc
  x=0;
  it=0;
  while 0!=3*x^2-12 && it<=10
    x=input("Ingrese valor de x0");
    it=it+1;
  endwhile
  disp("");x
  disp("");it
endfunction
