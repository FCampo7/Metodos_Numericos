clear
clc

Delta=1e-6;
Tol=1e-7;
Y = load('Matriz_Y');       %graficar v y w para comparar (ejercicio 1)
h=0.01;
x=0:h:5;                    %hay que derivar tita e y 
t_der=zeros(size(x));
y_der=zeros(size(x));
N=length(x); 
for v=2:N-1
    [D,err,relerr,n] = Extrapolacion_Richardson(Y.Y(1,:),v,Delta,Tol);
    Di=diag(D);
    t_der(v)=Di(length(Di));
end
save('Derivada_t.mat','t_der'); %guardamos los valores de la deivada de tita
H1=figure(1);
subplot(2,1,1);
plot(x,Y.Y(2,:),'r');
legend('w del Ejericio 1')
grid
xlabel('t [s]','fontsize',12)
ylabel('w(t) [rad/s]','fontsize',12)
subplot(2,1,2);
plot(x,t_der,'b');
legend('Derivada de \theta')
xlabel('t [s]','fontsize',12)
ylabel('w(t) [rad/s]','fontsize',12)
grid

for v=2:N-1
    [D,err,relerr,n] = Extrapolacion_Richardson(Y.Y(3,:),v,Delta,Tol);
    Di=diag(D);
    y_der(v)=Di(length(Di));
end
save('Derivada_y.mat','y_der'); %guardamos los valores de la derivada de y
H2=figure(2);
subplot(2,1,1);
plot(x,Y.Y(4,:),'r');
legend('v del Ejericio 1')
grid
xlabel('t [s]','fontsize',12)
ylabel('v(t) [m/s]','fontsize',12)
subplot(2,1,2);
plot(x,y_der,'b');
legend('Derivada de y')
xlabel('t [s]','fontsize',12)
ylabel('v(t) [m/s]','fontsize',12)
grid