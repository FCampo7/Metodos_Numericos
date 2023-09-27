Y = load('Matriz_Y.mat');

Y1 = load('V_Sub.mat');
Yv = Y1.Y2;      
Xo = 0:0.1:5;
A = Spline_Cubica(Xo,Yv);

X = 0:0.01:5;
N = length(Yv)-1;
Poli_Int = zeros(size(X)); % Inicialización de valores del polinomio
k=1;
Ind=1;
x2 = 0;
cont = 1;
while k<=N
    if X(k)<X(Ind+1)
        x1 = x2;
        x2 = x2 + 0.09;
        for j=x1:0.01:x2
            Poli_Int(cont)=Eval_Polinomio_single(j,A(Ind,:),x1);
            cont = cont+1;
        end
        x2 = x2+0.01;
        k=k+1;
    else
        Ind=Ind+1;
    end
    if Ind>N
        k=N+1;
    end    
end
save('V_Int.mat','Poli_Int'); 
H1=figure(1);
plot(X,Poli_Int,X,Y.Y(4,:)) % Nube de puntos originales y Spline Cúbica
title('Interpolación por Splines Cúbicos de Velocidad Traslacional');
xlabel('t [s]')
ylabel('v(t) [m/s]')
legend('Spline Cubica','Original')
grid

Y = load('W_Sub.mat');
Yw = Y.Y3;      
X = 0:0.1:5;
A = Spline_Cubica(X,Yw);
X = 0:0.01:5;
N = length(Yw)-1;
Poli_Int = zeros(size(X)); % Inicialización de valores del polinomio
k=1;
Ind=1;
x2 = 0;
cont = 1;
while k<=N
    if X(k)<X(Ind+1)
        x1 = x2;
        x2 = x2 + 0.09;
        for j=x1:0.01:x2
            Poli_Int(cont)=Eval_Polinomio_single(j,A(Ind,:),x1);
            cont = cont+1;
        end
        x2 = x2+0.01;
        k=k+1;
    else
        Ind=Ind+1;
    end
    if Ind>N
        k=N+1;
    end    
end
save('W_Int.mat','Poli_Int');
Y1 = load('Matriz_Y');      %datos del ejercicio 1
H2=figure(2);
plot(X,Poli_Int,X,Y1.Y(2,:))      % Nube de puntos originales y Spline Cúbica
title('Interpolación por Splines Cúbicos de Velocidad Angular');
xlabel('t [s]')
ylabel('w(t) [rad/s]')
legend('Spline Cubica','Original')
grid
