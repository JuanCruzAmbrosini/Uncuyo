function Meteorologia
  clear
  clc
  n=4;
  for i=1:n
    V(i)=input("Ingrese la temperatura");
    if i==1;
      tmin=V(1);
      tmax=V(1);
    endif
    if tmin>V(i);
      tmin=V(i);;
    endif
    if tmax<V(i);
      tmax=V(i);
    endif
  endfor
  disp=("La temp. max es : ") ,tmax
  disp=("La temp. min es : ") ,tmin
endfunction