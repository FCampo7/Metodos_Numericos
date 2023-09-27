%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Aproximaci�n Lineal por M�nimos Cuadrados:
%%%         y = Ax + B
%%%         function [A,B,CC] = Ajuste_Lineal_MC(X,Y)
%%% Par�metros de Entrada:
%%%       X = vector Nx1 con las abscisas de los pares de puntos
%%%       Y = vector Nx1 con las ordenadas de los pares de puntos
%%% Par�metros de Salida:
%%%      A = pendiente del Ajuste Lineal
%%%      B = Ordenada al origen
%%%      CC = Coeficiente de Correlaci�n
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [A,B,CC] = Aproximacion_Lineal(X,Y)

X_M=mean(X); % Promedio de abscisas
Y_M=mean(Y); % promedio de ordenadas

SX2=(X-X_M)'*(X-X_M); % suma de cuadrados de X
SY2=(Y-Y_M)'*(Y-Y_M); % suma de cuadrados de Y
SXY=(X-X_M)'*(Y-Y_M); % suma de productos cruzados de X e Y

A = SXY/SX2; % Pendiente del ajuste lineal
B = Y_M - A*X_M; % Ordenada del ajuste lineal
CC= SXY/sqrt(SX2*SY2); % Coeficiente de correlacion de la rect