% Problem 1 (a)
% build model
K = 1;
G1 = tf([1], [1 0.5]);
G2 = tf([1], [1 0]);
sys = feedback((series(G1, G2)), K, -1);
step(sys)
% Plot
figure(1), bode(sys)
figure(2), nyquist(sys)

% Problem 1 (b)
W = logspace(-2, 2, 800); % from 10^-1 to 10^1, 200 points for each decade
[mag, phase, w] = bode(sys, W);

% The max. magnitude and its resonant frequency 
[mag_peak, index] = max(mag); 
mag_peak
w_reasonant = w(index)

% precise value
[gain_peak, freq_peak] = getPeakGain(sys)

% Problem 1 (c)
%ltiview(sys);

% Problem 1 (d)
figure(3), margin(mag, phase, w)
[Gain_margin, Phase_margin] = margin(mag, phase, w)


% Problem 2
p = 0: 0.01 : 2;
n = length(p);
for i = 1 : n
    G = tf([7], [1 p(i) 0]);
    sys = feedback(G, 1, -1);
    BW(i) = bandwidth(sys);
end

figure(4)
plot(p, BW), title('Bandwidth v.s. parameter p'); 
xlabel('p value'), ylabel('Bandwidth');





