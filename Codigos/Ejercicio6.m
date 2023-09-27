clear
clc

Y1 = load('Matriz_Y');      %datos del ejercicio 1
T1 = 0:0.01:5;              %tiempo de muestreo original

T2 = 0:0.1:5;                        %tiempo de submuestro
Y2 = Y1.Y(4,1:10:length(Y1.Y));      %datos de v submuestreados
Y3 = Y1.Y(2,1:10:length(Y1.Y));      %datos de w submuestreados

save('V_Sub.mat','Y2');     %guardamos los datos submuestreados para 
save('W_Sub.mat','Y3');     %el proximo ejercicio

h1=figure(1);
plot(T2,Y2,'r',T1,Y1.Y(4,:),'b');
grid;
legend('Señal Submuestreada','Señal Original')
xlabel('t [s]','fontsize',12);
ylabel('v(t) [m/s]','fontsize',12);

h2=figure(2);
plot(T2,Y3,'r',T1,Y1.Y(2,:),'b');
grid;
legend('Señal Submuestreada','Señal Original')
xlabel('t [s]','fontsize',12);
ylabel('w(t) [rad/s]','fontsize',12);