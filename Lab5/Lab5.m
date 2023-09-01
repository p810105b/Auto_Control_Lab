% Problem 3.1
num = [3 10 1];
den = [1 8 5];
G = tf(num, den);

% method 1
sys = ss(G)
% method 2
[A, B, C, D] = tf2ss(num, den)

% Vertify the results
G_1 = tf(sys)
G_2 = tf(ss(A, B, C, D))


% Problem 3.2
A = [ 1 1 0 ;
     -2 0 4 ;
      6 2 10];

B = [0 ; 
     0 ; 
     1];

C = [0 1 0];

D = [0];

% method 1
[num, den] = ss2tf(A, B, C, D)
% method 2
sys = tf(ss(A, B, C, D))

% Vertify the results
% There are many set of solutions 
% we can not determine the correctness
[A_1, B_1, C_1, D_1] = tf2ss(num, den) 

% return transfer fnc again to vertify
sys_1 = tf(ss(A_1, B_1, C_1, D_1))     




% Problem 3.4 (a)
A = [ 0  1  0 ;
      0  0  1 ;
     -3 -2 -5];

B = [0 ; 0 ; 1];

C = [1 0 0];

D = [0];

sys_ss = ss(A, B, C, D);

% initial condition
x_0 = [0 -1 1]'; 
% Time setting
t = [0 : 0.1 : 10];
% zero input
u = 0 * t; 

[y, T, x] = lsim(sys_ss, u, t, x_0);
subplot(5, 1, 1), plot(T, x), ylabel('x'), grid on;
legend('x[1]', 'x[2]', 'x[3]')
subplot(5, 1, 2), plot(T, x( :, 1), 'b'), ylabel('x[1]'), grid on;
subplot(5, 1, 3), plot(T, x( :, 2), 'b'), ylabel('x[2]'), grid on;
subplot(5, 1, 4), plot(T, x( :, 3), 'b'), ylabel('x[3]'), grid on;
subplot(5, 1, 5), plot(T, y, 'r'), xlabel('Time'), ylabel('y'), grid on;

% Problem 3.4 (b)
dt = 10;
Transition_matrix = expm(A * dt) * x_0