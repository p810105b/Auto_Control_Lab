% Problem 1
% G(s) = 6s^2 + 1 / s^3 + 3s^2 + 3s + 1 
G = tf([6, 0, 1], [1, 3, 3, 1])

% H(s) = (s+1)(s+2) / (s+2i)(s-2i)(s+3)
n1 = [1, 1];    % (s+1)
n2 = [1, 2];    % (s+2)

d1 = [1, 2*i];  % (s+2i)
d2 = [1, -2*i]; % (s-2i)
d3 = [1, 3];    % (s+3)
num = conv(n1, n2);           % (s+1)(s+2)
den = conv(d1, conv(d2, d3)); % (s+2i)(s-2i)(s+3)
H = tf(num, den)

% (a)
Pole_G = pole(G)
Zero_G = zero(G)

Pole_H = pole(H)
Zero_H = zero(H)

% (b)
tranfer_fnc = tf(G / H)
% Plot pole and zero map
pzmap(tranfer_fnc)


% Problem 2
k = 10;
G1 = tf(k, [2, 3]); % 10 / 2s + 3
k = 30;
G2 = tf(k, [2, 3]); % 30 / 2s + 3
k = 60;
G3 = tf(k, [2, 3]); % 60 / 2s + 3
step(G1,'-k', G2,'*-r', G3,'-ob', 10)
grid on;
legend('G1', 'G2', 'G3')