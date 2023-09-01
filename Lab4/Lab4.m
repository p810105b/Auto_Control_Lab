% Problem 1 (a)
sys1 = tf(1, [2,1]);
sys2 = tf(1, [1,2]);
sys3 = tf(2, [3,1]);
sys4 = tf(5, [4,3]);
sys5 = tf(1, [1,1]);

C1 = parallel(sys1, sys2);
C2 = series(C1, sys3);
% feedback
C3 = parallel(sys4, sys5);
Transfer_fnc = feedback(C2, C3)

% Problem 1 (b)
step(Transfer_fnc)


% Problem 2 (a)
z = 3;
k = 15 / z;
num = [1, z];
den = [1, 3, 15];
G1 = tf(k*num, den);

z = 6;
k = 15 / z;
num = [1, z];
den = [1, 3, 15];
G2 = tf(k*num, den);

z = 12;
k = 15 / z;
num = [1, z];
den = [1, 3, 15];
G3 = tf(k*num, den);

step(G1,'-k',  G2,'-r',  G3,'-b')
grid on;
legend('G1', 'G2', 'G3')

% Problem 3
syms G1 G2 G3 G4 H1 H2 H3;
Q(1, 5) = -H1;
Q(2, 4) = -H2;
Q(3, 5) = -H3;
Q(2, 1) =  G1;
Q(3, 2) =  G2;
Q(4, 3) =  G3;
Q(5, 4) =  G4;

% X0 = R(S)  - H1*X4
% X1 = G1*X0 - H2*X3
% X2 = G2*X1 - H3*X4
% X3 = G3*X2
% X4 = G4*X3
% C(S) = X4

% |X0|   |0  0  0   0   -H1 | |X0|   |1|
% |X1|   |G1 0  0  -H2   0  | |X1|   |0|
% |X2| = |0  G2 0   0   -H3 | |X2| + |0| R
% |X3|   |0  0  G3  0    0  | |X3|   |0|
% |X4|   |0  0  0   G4   0  | |X4|   |0|

P = [1;0;0;0;0];
I = eye(size(Q));
W = (I - Q) \ P;
Transfer_fnc = W(5)

% Problem 4
num_G1 = [1 5]; den_G1 = [1 10];
num_G2 = [1];   den_G2 = [1 4];
num_H1 = [1];   den_H1 = [1]; 
num_H2 = [1];   den_H2 = [1]; 

G1 = tf(num_G1, den_G1);
G2 = tf(num_G2, den_G2);
H1 = tf(num_H1, den_H1);
H2 = tf(num_H2, den_H2);

% STEP1 : H1 / G2
% num_1 = conv(num_H1, den_G2);
% den_1 = conv(den_H1, num_G2);
% D1 = tf(num_1, den_1)
D1 = tf(H1 / G2);

% STEP2 : feedback of H2
% [num_2, den_2] = feedback(num_G2, den_G2, num_H2, den_H2);
% D2 = tf(num_2, den_2)
D2 = feedback(G2, H2, -1);

% STEP3 : series for G1 and D2
% [num_3, den_3] = series(num_G1, den_G1, num_D2, den_D2);
% D3 = tf(num_3, den_3)
D3 = series(G1, D2);

% STEP3 : feedback of D1
Transfer_fnc = feedback(D3, D1, -1)

