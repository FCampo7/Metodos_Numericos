%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Aproximación central de derivada de orden cuadrático
%%% Parámetros de Entrada:
%%%       f = vector de valores discretos
%%%       a y b limites de integracion 
%%%       M = cantidad de sub intervalos
%%% Parámetros de Salida:
%%%       S = la solucion de la integracion definida, suma discreta
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function S = Regla_Simpson_Compuesta(f,a,b,M)
h=(b-a)/(2*M);
S=0;
for k=3:M
    S = S +f(k-2)+4*f(k-1)+f(k);
end
S=S*h/3;
