clear
clc

a = 0;      %limite inferior 
b = 5;      %limite superior
M = 500;    %cantidad de sub intervalos
Y = load('Matriz_Y');   %datos del ejercicio 1
t=0:0.01:5;

Yv = Y.Y(4,:);          %datos de v
Sv = Regla_Simpson_Compuesta(Yv,a,b,M);

for k=1:1:length(Yv)      %para graficar de distinto color
    if(Yv(k)>0)
        Yv_pos(k) = Yv(k);
        Yv_neg(k) = 0;
    end
    if(Yv(k)<0)
        Yv_pos(k) = 0;
        Yv_neg(k) = Yv(k);
    end
end
h1=figure(1);
stem(t,Yv_pos,'r')
hold on
stem(t,Yv_neg,'b')
grid
txt = ['Area de la velocidad traslacional: ' num2str(Sv)];
text(2,0.5,txt)
title('Velocidad Traslacional')
xlabel('t [s]')
ylabel('v(t) [m/s]')

Yw = Y.Y(2,:);          %datos de w
Sw = Regla_Simpson_Compuesta(Yw,a,b,M);

h2=figure(2);
for k=1:1:length(Yw)      %para graficar de distinto color
    if(Yw(k)>0)
        Yw_pos(k) = Yw(k);
        Yw_neg(k) = 0;
    end
    if(Yw(k)<0)
        Yw_pos(k) = 0;
        Yw_neg(k) = Yw(k);
    end
end
stem(t,Yw_pos,'r')
hold on
stem(t,Yw_neg,'b')
grid
txt = ['Area de la velocidad angular: ' num2str(Sw)];
text(2,2,txt)
title('Velocidad Angular')
xlabel('t [s]')
ylabel('w(t) [rad/s]')

X = load('Matriz_X');   %datos del ejercicio 1

Fk1 = X.X(:,4);          %datos de fk1
SFk1 = Regla_Simpson_Compuesta(Fk1',a,b,M);
h3=figure(3);
for k=1:1:length(Fk1)      %para graficar de distinto color
    if(Fk1(k)>0)
        Yfk1_pos(k) = Fk1(k);
        Yfk1_neg(k) = 0;
    end
    if(Fk1(k)<0)
        Yfk1_pos(k) = 0;
        Yfk1_neg(k) = Fk1(k);
    end
end
stem(t,Yfk1_pos,'r')
hold on
stem(t,Yfk1_neg,'b')
grid
txt = ['Area de la Fuerza del Resorte 1: ' num2str(SFk1)];
text(2,400,txt)
title('Fk1')
xlabel('t [s]')
ylabel('Fk1(t) [N]')

Fk2 = X.X(:,1);          %datos de fk2
SFk2 = Regla_Simpson_Compuesta(Fk2',a,b,M);
h4=figure(4);
stem(t,Fk2,'r')
grid
txt = ['Area de la Fuerza del Resorte 2: ' num2str(SFk2)];
text(2,700,txt)
title('Fk2')
xlabel('t [s]')
ylabel('Fk2(t) [N]')