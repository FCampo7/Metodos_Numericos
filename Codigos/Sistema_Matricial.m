function [F]= Sistema_Matricial(t,X)
L1 = 0.03;
L2 = 0.17;
K1 = 30250;
K2 = 937;
M = 50;
J = 1;
B = 15;
g = 9.81;
Fo = 490;
fe = Fo;

A = zeros(4);
A(1,2)= K2*L2;
A(1,3)= -K2;
A(2,1)= -L2/J;
A(2,2)= -B/J;
A(2,4) = -L1/J;
A(3,1) = 1/M;
A(4,2) = K1*L1;

B = zeros(4,2);
B(2,1) = L2/J;
B(3,2) = -1;
U = [fe g];

F=A*X'+B*U';
F=F';
end