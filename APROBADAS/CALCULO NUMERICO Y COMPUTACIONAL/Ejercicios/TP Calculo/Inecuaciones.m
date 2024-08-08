function Inecuaciones
  clear
  clc
  x=input("Ingrese X")
  y=input("Ingrese Y")
  if y<3 && x+y>1 && y<(2*x)+1 && y>x
    disp=("El punto P esta dentro del area establecida")
  else
    disp=("El punto P no esta dentro del area establecida")
  endif
endfunction