%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Parámetros de Entrada:
%%%       f = vector de valores discretos
%%%       x = abscisa donde se evaluará la derivada
%%%       Delta = Tolerancia del Error para las aproximaciones k-ésimas de la derivada    
%%%       Tol = Tolerancia del Error Relativo para las aproximaciones k-ésimas de la derivada
%%% Parámetros de Salida:
%%%       D =  matriz que contiene las aproximaciones de orden 2k en la diagonal principal
%%%       err = error absoluto final
%%%       relerr = error relativo final
%%%       n = el valor de k en donde se produce la mejor aproximación de la derivada
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [D,err,relerr,n] = Extrapolacion_Richardson(f,x,Delta,Tol)
Max = 15;
h = 1;
err = 1;
relerr = 1;
j = 1;
D(1,1) = (f(x+h)-f(x-h))/(2*h);   % este es el D0(h)
while (err > Delta) && (relerr > Tol) && (j <= Max)
    h = h/1.35;
    D(j+1,1) = (f(x+1)-f(x-1))/(2*h);
    for k=1:j
       D(j+1,k+1) = D(j+1,k)+(D(j+1,k)-D(j,k))/((4^k)-1);
    end
    err = abs(D(j+1,j+1)-D(j,j));
    relerr = 2 * err / (abs(D(j+1,k+1))+abs(D(j,k))+eps);
    j = j+1;
end
n = size(D,1)-1;