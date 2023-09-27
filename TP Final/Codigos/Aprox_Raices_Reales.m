%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Solucion Aproximada de Raices Reales
%%% function [r,A] = Aprox_Raices_Reales(f,delta)
%%% Parámetros de Entrada:
%%%       f = vector de valores discretos
%%%       delta = error final querido (exactitud del método)
%%% Parámetros de Salida:
%%%      r  = vector de raices aproximadas de f(x) para el intervalo [a,b]
%%%      A = vector de valores de las raices
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [r,A] = Aprox_Raices_Reales(f,delta)
cont = 1;
r = zeros();
A = zeros();
for k=2:length(f)-1
    y_xk = f(k);          %xk
    y_xk1 = f(k-1);       %xk-1
    y_xk2 = f(k+1);       %xk+1
    
    if (y_xk*y_xk1) < 0
        r(cont) = (k+k-1)/2;
        A(cont) = (y_xk+y_xk1)/2;
        cont = cont+1;
    elseif ((y_xk2 - y_xk)*(y_xk - y_xk1)) < 0 && abs(y_xk) < delta
        r(cont) = k;
        A(cont) = y_xk;
        cont = cont+1;
    end
end