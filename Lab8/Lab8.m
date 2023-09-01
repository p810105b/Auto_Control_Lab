% Problem 1
% build model
G = tf([1 1], [1 0.6 1]);
sys = feedback(G, 1, -1);

% The response with unit step input
t = [0 : 0.001 : 10];
[y, T] = step(sys, t);

% determine the property of sys
[y_max, k] = max(y); % k for the position of y_max

peak_value  = y_max
peak_time   = t(k)
final_value = dcgain(sys)
overshoot   = y_max - final_value
P_O         = 100*(y_max - final_value)/final_value

% n for the position of maximum value smaller than 10% final_value
% m for the position of maximum value smaller than 90% final_value
n = 1; while y(n) < 0.1*final_value, n = n + 1; end   
m = 1; while y(m) < 0.9*final_value, m = m + 1; end   
rise_time = t(m) - t(n)

% l starts from the lastest position
% and shifts to the left side gradually
% until shifts to the value excesses 2% of final_value
l = length(t);
while y(l) > 0.98*final_value & y(l) < 1.02*final_value
    l = l - 1;
end
settling_time = t(l)

plot(T, y)
xlabel('time(sec)');
ylabel('y(t)');
grid on;

% open ltiview
% ltiview

% Problem 2 verification
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
[y1,T1] = step(sys1, t); 
[y2,T2] = step(sys2, t);
[y3,T3] = step(sys3, t); 
[y4,T4] = step(sys4, t);

% plot the output response
subplot(2,2,1), plot(T1, y1);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 1 (\zeta = 0, \omega_n = 2)'); 

subplot(2,2,3), plot(T2, y2);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 2 (\zeta = 0.1, \omega_n = 2)');

subplot(2,2,2), plot(T3, y3);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 3 (\zeta = 0, \omega_n = 1)');

subplot(2,2,4), plot(T4, y4);
xlabel('Time(sec)'), ylabel('y(t)'), grid; 
title('case 4 (\zeta = 0.2, \omega_n = 1)');

