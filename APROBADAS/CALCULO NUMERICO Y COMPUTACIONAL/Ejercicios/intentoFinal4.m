%Aplicación Metodo de Euler Modificado
%h Paso
%fm(xm,ym)
%xg=x1=xm+h/2
%yg=ym+h*fm/2
%fg=f(xg,yg)
%y1=ym+h*fg
clear, clc
format short
%Datos
L=sqrt(50);
T=2500;
ro=65;
b=80;
om=5;
h=0.004;
Dx=L/2;
fx=[alf; (b*sin(pi/2)*sin(om*x)-2*(T*u)/(Dx^2))/ro];
x0=0;
y0=[0; 0];
y=[u; alf];
K=0;
i=0;
Y=[];
X=[];
%fprintf(' %2s %15s %15s %15s %15s %15s %15s %15s \n', 'K', 'X0','Fx1', 'Fx2', 'Fg1', 'Fg2', 'U', 'Alfa')
while i<=6
   i=i+h;
   K=K+1;
   x=x0;
   u=y0(1);
   alf=y0(2);
   Fx=eval(fx);
   xg=x0+h/2;
   yg=y0+h*Fx/2;
   u=yg(1);
   alf=yg(2);
   x=xg;
   Fg=eval(fx);
   y1=y0+h.*Fg;
   Y=[Y y1];
   %fprintf(' %2d %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f \n' ,K,x0,Fx,Fg,y1)
   %fprintf('%15.5f %15.5f \n', y1)
   x0=x0+h;
   y0=y1;
end
figure
plot(Y(1,:))
grid on
figure
plot(Y(1,:),Y(2,:))
grid on
