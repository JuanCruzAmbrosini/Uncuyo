function RaicesCuadradas
  clear
  clc
  a=input("Ingrese a");
  b=input("Ingrese b");
  c=input("Ingrese c");
  if (b^2-4*a*c)>=0;
    r1=(-b+(b^2-4*a*c)^(1/2))/(2*a);
    r2=(-b-(b^2-4*a*c)^(1/2))/(2*a);
    disp("La primer raiz es"),r1
    disp("La segunda raiz es"),r2
  else
    disp("No tiene raices en lo reales")
  endif
endfunction