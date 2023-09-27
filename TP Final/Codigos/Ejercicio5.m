clear
clc

delta = 0.00000000000001;
a=0;
b=5;
Y = load('Matriz_Y.mat');   %valores del ejercicio 1
Yw = Y.Y(2,:);
[r,A] = Aprox_Raices_Reales(Yw,delta);
Prom = mean(A);              %calcula el valor medio
Desvio_est = std(A);         %calcula el desvio estandar
x=0:0.01:5;
z = zeros(1,length(r));
H1 = figure(1);
plot(x,Yw,'b',r.*10^-2,z,'*')
title('Cruces por cero de w(t)')
xlabel('t [s]','fontsize',13);
ylabel('w(t) [rad/s]','fontsize',13);
txt = ['Promedio: ' num2str(Prom)];
text(2,-2,txt)
txt = ['Desvio Estandar: ' num2str(Desvio_est)];
text(2,-3,txt)
grid

Yv = Y.Y(4,:);
[r,A] = Aprox_Raices_Reales(Yv,delta);
Prom = mean(A);              %calcula el valor medio
Desvio_est = std(A);         %calcula el desvio estandar
x=0:0.01:5;
z = zeros(1,length(r));
H2 = figure(2);
plot(x,Yv,'b',r.*10^-2,z,'*')
title('Cruces por cero de v(t)')
xlabel('t [s]','fontsize',13);
ylabel('v(t) [m/s]','fontsize',13);
txt = ['Promedio: ' num2str(Prom)];
text(2,-1,txt)
txt = ['Desvio Estandar: ' num2str(Desvio_est)];
text(2,-1.5,txt)
grid
