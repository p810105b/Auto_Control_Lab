% Problem 1
% build model
G   = tf([1 7], [1 10 0 0]);
sys = feedback(G, 1, -1);

% response for sys with unit ramp input
t = [0 : 0.1 : 25]';
% unit ramp input
u = t;

[y, T] = lsim(sys, u, t);

% plot the output response
plot(T, y, t, u,'--');
title('Problem 1');
xlabel('Time(seconds)');
ylabel('y(t)');
grid on;
legend('Output', 'Input');
text(13, 13, '\leftarrow Input' , 'FontSize', 14);
text(9.5, 8, '\leftarrow Output', 'FontSize', 14);


% Problem 2
% parameters setting
omega_n1 = 2; zeta_1 = 0;
omega_n2 = 2; zeta_2 = 0.1;
omega_n3 = 1; zeta_3 = 0;
omega_n4 = 1; zeta_4 = 0.2;

% build model
num_1 = [omega_n1^2]; den_1 = [1 2*zeta_1*omega_n1 omega_n1^2];
num_2 = [omega_n2^2]; den_2 = [1 2*zeta_2*omega_n2 omega_n2^2];
num_3 = [omega_n3^2]; den_3 = [1 2*zeta_3*omega_n3 omega_n3^2];
num_4 = [omega_n4^2]; den_4 = [1 2*zeta_4*omega_n4 omega_n4^2];
sys1 = tf(num_1, den_1);
sys2 = tf(num_2, den_2);
sys3 = tf(num_3, den_3);
sys4 = tf(num_4, den_4);

% response with impulse input
t=[0:0.1:15]; 
[y1,T1] = impulse(sys1, t); 
[y2,T2] = impulse(sys2, t);
[y3,T3] = impulse(sys3, t); 
[y4,T4] = impulse(sys4, t);

% plot the output response
subplot(2,2,1), plot(T1, y1);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 1 (\zeta = 0, \omega_n = 2)'); 

subplot(2,2,2), plot(T2, y2);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 2 (\zeta = 0.1, \omega_n = 2)');

subplot(2,2,3), plot(T3, y3);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 3 (\zeta = 0, \omega_n = 1)');

subplot(2,2,4), plot(T4, y4);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 4 (\zeta = 0.2, \omega_n = 1)');


% Problem 3
% build model
G1 = tf([2 1], [1 0]);
G2 = tf([-10], [1 10]);
G3 = tf([-1 -5], [1 3.5 6 0]);
C1 = series(G1, G2);
C2 = series(C1, G3);
sys = feedback(C2, 1, -1);

t = [0 : 0.1 : 15]';
% impulse input
u    = zeros(size(t)); 
u(1) = 10; % dirac area = 1, dt = 1/10
% response for sys with impulse input = 10
[y, T] = lsim(sys, u, t);
% plot the output response
plot(T, y, t, u,'--');
title('Problem 3');
xlabel('Time(seconds)');
ylabel('y(t)');
grid on;
legend('Output', 'Input');

% Compare with lsim() and impulse()
[y  , T  ] = lsim(sys, u, t);
[y_1, T_1] = impulse(sys, t);

plot(T, y,'r', T_1, y_1,'b--');
title('Compare with the output for lsim() and impulse()');
xlabel('Time(seconds)'), ylabel('y(t)'), grid on;
legend('output for lsim()', 'output for impulse()');

% Problem 4
% parameters setting
Kp = 5; 
Ki_1 = 1;
Ki_2 = 5;
Ki_3 = 10;
Ki_4 = 20;

% build model
C1_1 = tf([Kp Ki_1], [1 0]); G2_1 = tf([20], [1 4 20]);
C1_2 = tf([Kp Ki_2], [1 0]); G2_2 = tf([20], [1 4 20]);
C1_3 = tf([Kp Ki_3], [1 0]); G2_3 = tf([20], [1 4 20]);
C1_4 = tf([Kp Ki_4], [1 0]); G2_4 = tf([20], [1 4 20]);
sys1 = feedback(series(C1_1, G2_1), 1, -1);
sys2 = feedback(series(C1_2, G2_2), 1, -1);
sys3 = feedback(series(C1_3, G2_3), 1, -1);
sys4 = feedback(series(C1_4, G2_4), 1, -1);

% response with step input
t = 0 : 0.1 : 10;
[y1, T1] = step(sys1, t);
[y2, T2] = step(sys2, t);
[y3, T3] = step(sys3, t);
[y4, T4] = step(sys4, t);

% plot the output response
subplot(2, 2, 1), plot(T1, y1), title('Ki = 1'),  grid; 
subplot(2, 2, 2), plot(T2, y2), title('Ki = 5'),  grid; 
subplot(2, 2, 3), plot(T3, y3), title('Ki = 10'), grid; 
subplot(2, 2, 4), plot(T4, y4), title('Ki = 20'), grid; 

