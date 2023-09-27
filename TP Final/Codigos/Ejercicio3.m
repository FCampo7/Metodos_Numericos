clear
clc

X = load('Matriz_Y');   %valores del ejercicio 1
Xw = X.Y(2,:);

Y = load('Derivada_t');     %valores del ejercicio 2 de tita
Yw = Y.t_der;

[A,B,CC] = Aproximacion_Lineal(Xw',Yw');
x1=-4:0.01:4;
Ajuste_w = A*x1 + B;
E1 = sqrt(sum((Xw-Yw).^2))/length(Xw);      %error cuadratico medio
H1=figure(1);
plot(x1,Ajuste_w,Yw,Xw,'*');
title('Ajuste Lineal de w')
xlabel('derivada \theta [rad/s]','fontsize',12)
ylabel('w(t) [rad/s]','fontsize',12)
legend('Ajuste Lineal','Nube de Puntos')
txt = ['Pendiente: ' num2str(A)];
text(-3,2,txt)
txt = ['Ordenada al Origen: ' num2str(B)];
text(-3,3,txt)
txt = ['Coeficiente de Correlacion: ' num2str(CC)];
text(-3,4,txt)
txt = ['Error Cuadratico Medio: ' num2str(E1)];
text(-3,1,txt)
grid

Xv = X.Y(4,:);
Y = load('Derivada_y'); %valores del ejercicio 2 de y
Yv = Y.y_der;
[A,B,CC] = Aproximacion_Lineal(Xv',Yv');
x2=-2:0.01:2;
Ajuste_v = A*x2 + B;
E2 = sqrt(sum((Xv-Yv).^2))/length(Xv);  %error cuadratico medio
H2=figure(2);
plot(x2,Ajuste_v,Yv,Xv,'*');
title('Ajuste Lineal de v')
xlabel('derivada y [m/s]','fontsize',12)
ylabel('v(t) [m/s]','fontsize',12)
legend('Ajuste Lineal','Nube de Puntos')
txt = ['Pendiente: ' num2str(A)];
text(-1.5,1,txt)
txt = ['Ordenada al Origen: ' num2str(B)];
text(-1.5,1.5,txt)
txt = ['Coeficiente de Correlacion: ' num2str(CC)];
text(-1.5,2,txt)
txt = ['Error Cuadratico Medio: ' num2str(E2)];
text(-1.5,0.5,txt)
grid