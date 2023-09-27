clear
clc
L1 = 0.03;
L2 = 0.50;
K1 = 30250;
K2 = 9370;
t0 = 0;
tf = 5;
xo = [0 0 0 0];
h = 0.01;
[T,X] = Metodo_Runge_Kutta('Sistema_Matricial_Mod',t0,tf,xo,h);

C=[0 0 0 1/(K1*L1); 0 1 0 0; -1/K2 0 0 L2/(K1*L1); 0 0 1 0];
Y=C*X';

h1=figure(1);
subplot(2,1,1);
plot(T',Y(1,:));
grid
xlabel('t [s]','fontsize',13);
ylabel('\theta(t) [rad]','fontsize',13);
title('Movimiento Angular. Segundo Caso','fontsize',15);
subplot(2,1,2);
plot(T',Y(2,:));
grid;
xlabel('t [s]','fontsize',13);
ylabel('w(t) [rad/s]','fontsize',13);
xlim([0 5]);

h2=figure(2);
subplot(2,1,1);
plot(T',Y(3,:));
grid
xlabel('t [s]','fontsize',13);
ylabel('y(t) [m]','fontsize',13);
title('Movimiento Traslacional. Segundo Caso','fontsize',15);
subplot(2,1,2);
plot(T',Y(4,:));
grid;
xlabel('t [s]','fontsize',13);
ylabel('v(t) [m/s]','fontsize',13);
xlim([0 5]);