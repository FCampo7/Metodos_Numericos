%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Metodo de RUNGE-KUTTA Orden 4
%%% Resolucion de Sistemas Ecuaciones Diferenciales de primer Orden:
%%%         x1'=f1(t,x1,x2,...,xn)
%%%         x2'=f2(t,x1,x2,...,xn)
%%%         x3'=f3(t,x1,x2,...,xn)
%%%              :   :   :
%%%         xn'=fn(t,x1,x2,...,xn)
%%% function [T,X] = Ec_Dif_Runge_Kutta_O4_Sistemas(F,t0,tf,X0,M)
%%% Parametros de Entrada:
%%%       F  = AX+B Nombre del Sistema de EC de Primer Orden (Contenido en forma Matricial en un script MatLab)
%%%       t0 = Tiempo inicial de an?lisis de la Ecuacion Diferencial
%%%       tf = Tiempo final de analisis de la Ecuacion Diferencial
%%%       X0 = [x1(t0) x2(t0) x3(t0)...xn(t0)] Condicion inicial del Sietema de ED de primer orden
%%% Parametros de Salida:
%%%      T: Vector Columna de tiempo
%%%      X = Matriz resultado. Col#1: vector Solucion x1; Col#2: Vector
%%%      solucion x2...;Col#n: vector solucion xn
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [T,X]=Metodo_Runge_Kutta(F,t0,tf,X0,h)
%X0 vector fila de condiciones iniciales
%F sistema a resolver
N=(tf-t0)/h;
T=t0:h:tf;
X=zeros(N+1,length(X0));
X(1,:)=X0;
for k=1:N
    f1=feval(F,T(k),X(k,:));
    f2=feval(F,T(k)+h/2,X(k,:)+(h/2)*f1);
    f3=feval(F,T(k)+h/2,X(k,:)+(h/2)*f2);
    f4=feval(F,T(k)+h,X(k,:)+(h)*f3);
    X(k+1,:)=X(k,:)+h*(f1+2*f2+2*f3+f4)/6;
end
T=T';