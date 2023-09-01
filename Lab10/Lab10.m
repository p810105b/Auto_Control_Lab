% Problem 1
%            1
% sys = -------------
%        s(s+2)(s+5)
% 1 + K*sys = 0 (charactristics equation)
sys = tf([1], conv([1 0], conv([1 2], [1 5])));
% Sketch the root locus
rlocus(sys);

% Test_1 the value of K 
% K >= 70 unstable
K = 70; 
G = tf([K], [1 2 0]);
H = tf([1], [1 5]);
T = feedback(G, H, -1);
step(T)

% K <  70 stable
K = 69.9; 
G = tf([K], [1 2 0]);
H = tf([1], [1 5]);
T = feedback(G, H, -1);
step(T)

% Problem 2
% P.0. = 100*e^(-zeta*pi / sqrt(1 - zeta^2))% <= 10%
% The soultion of zeta as following
P_O = 0.1;
zeta = ((log(P_O)/pi)^2 / (1+(log(P_O)/pi)^2))^0.5; 
theta = acosd(zeta);
% Ts = 4/zeta*omega_n = 10
plot([-0.4 -0.4], [-8 8], '--',... 
     [0  8/tand(180-theta)], [0  8], '--',...
     [0 -8/tand(180+theta)], [0 -8], '--')
hold on;

sys = tf([1], [1 5 6 0]);
rlocus(sys)
[kp, poles] = rlocfind(sys)
figure
t = 0 : 0.1 : 15;
T = feedback(kp * sys, 1, -1);
[y, t] = step(T, t);
plot(t, y), grid on;
xlabel('time (sec)'), ylabel('y(t)');



