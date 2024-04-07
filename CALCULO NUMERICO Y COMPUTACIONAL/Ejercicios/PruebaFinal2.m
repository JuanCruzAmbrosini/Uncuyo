function final_14_02_23numa
  td=750;
  t0=0;
  tf=6*td;
  dt=10;
  z0=zeros(6,1); %CI
  it=0;
  w=0.5;
  K=(1/50)*[-2,1,0,0,0,0;
          1,-2,1,0,0,0;
          0,1,-2,1,0,0;
          0,0,1,-2,1,0;
          0,0,0,1,-2,1;
          0,0,0,0,2/3,-2/3];
  p=(1/50)*[1;0;0;0;0;0];
  for t=t0:dt:tf
    dz=K*z0+p*g(t); %y=edo dada
    k1=dz*dt;
    tg=t0+dt/(2*w);
    zg=z0+k1/(2*w);
    dzg=K*zg+p*g(t);
    k2=dzg*dt;
    it=it+1;
    Mz(:,it)=z0;
    vt(it)=t;
    t0=t0+dt;
    z0=z0+(1-w)*k1+w*k2; %recurrencia
  endfor
  figure(1)
  plot(vt,Mz(3,:),':r')
  title('evolucion de z3 en funcion de t')
  disp(Mz)
%---responder para tk=tf/2
  tk=tf/2;
  ztk=Mz(:,tk/dt+1); %vector z en t=tk
  xi=1;
  xf=1.7;
  dx=(xf-xi)/7
  vx=[xi:dx:xf]';
  uxt=zeros(8,1);
  uxt(1)=g(tk);
  for j=2:7
    uxt(j)=ztk(j-1);
  endfor
  uxt(8)=(4*ztk(6)-ztk(5))/3;
  dimensionuxt=disp(size(uxt))
  figure(2)
  plot(vx,uxt)
  title('grafico de la funcion u(x,t) en tk')
  %derivada 1° de u respecto a x
  dudx=deriv(uxt,dx)
  figure(3)
  plot(vx,dudx)
  title('du/dx')
  %integral
  Int=ITC((dudx).^2,dx)
  %MINIMOS CUADRADOS
  p=length(vx);
  FI=ones(p,3);
  for i=1:p
    FI(:,2)=1/vx(i);
    FI(:,3)=1/vx(i)^2;
  endfor
  %fiii=disp(FI)
  a=inv(FI'*FI)*(FI'*uxt)
endfunction
%----------subprograma derivadas-----------------------------------
function dy=deriv(vector,paso)
  m=length(vector);
  %para el primer punto
  dy(1)=(-3*vector(1)+4*vector(2)-vector(3))/(2*paso);
  %para el ultimo punto
  dy(m)=(3*vector(m)-4*vector(m-1)+vector(m-2))/(2*paso);
  %para los puntos del medio
  for i=2:m-1
    dy(i)=(vector(i+1)-vector(i-1))/(2*paso);
  endfor
endfunction
%----------subprograma integral--------------------------------------------
function I=ITC(vector,paso)
  n=length(vector);
  coef=ones(n,1);
  coef(1)=0.5;
  coef(n)=0,5
  I=0;
  for i=1:n
    I=I+paso*(coef(i)*vector(i));
  endfor
  endfunction
%----------subprograma funcion g-------------------------------------------
function g=g(t)
  td=750;
  if t<td
    g=(t/td)*300;
  else
    g=300;
  endif
endfunction



















