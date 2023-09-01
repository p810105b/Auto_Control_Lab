% Problem 1
clear all
K = [0 : 0.1 : 5];
nth_k = [];
j = 1;

for i = 1 : length(K)
    num = [1]; 
    den = [1 5 K(i)-3 K(i)];
    sys = feedback(tf(num, den), 1, -1);
    P(:, i) = pole(sys);
    % Stability condition (left half plane)
    if (real(P(:, i)) < 0)
        k(j) = K(i);
        p(:, j) = P(:, i);
        j = j + 1;
        nth_k = [nth_k, i];
    end
end

k_min = min(k) % [k_min, index_min] = min(k)
k_max = max(k) % [k_max, index_max] = max(k)
index_min = find(k == min(k));
index_max = find(k == max(k));

all_poles  = P 
min_k_root = p(:, index_min)
max_k_root = p(:, index_max)

% Plot stability poles
figure(1)
plot(nth_k, k, 'bX');
title('The value of K');
xlabel('n-th posiotion of k array'), ylabel('K value'), grid on;

figure(2)
plot(real(p), imag(p), 'x'), grid on;
title('stability poles');
xlabel('Real axis'), ylabel('Imaginary axis');

% Plot all poles 
figure(3)
plot(real(P), imag(P), 'x'), grid on;
title('all poles');
xlabel('Real axis'), ylabel('Imaginary axis');



% Problem 2 
clear all
K = [0 : 0.5 : 30]; 
nth_k = [];
j = 1;

for i = 1 : length(K)
    Plant = tf([5], [1 10 0]);
    Controller = tf([2 K(i)], [1 0]);
    G = feedback(Plant, Controller, -1);
    P(:, i) = pole(G);
    % Stability condition
    if (real(P(:, i)) < 0)
        k(j) = K(i);
        p(:, j) = P(:, i);
        j = j + 1;
        nth_k = [nth_k, i];
    end
end

k_min = min(k) % [k_min, index_min] = min(k)
k_max = max(k) % [k_max, index_max] = max(k)
index_min = find(k == min(k));
index_max = find(k == max(k));

all_poles  = P; 
min_k_root = p(:, index_min)
max_k_root = p(:, index_max)

% Plot stability poles 
figure(1)
plot(nth_k, k, 'bX');
title('The value of K');
xlabel('n-th posiotion of k array'), ylabel('K value'), grid on;

figure(2)
plot(real(p), imag(p), 'x'), grid on;
title('stability poles');
xlabel('Real axis'), ylabel('Imaginary axis');

% Plot all poles 
figure(3)
plot(real(P), imag(P), 'x'), grid on;
title('all poles');
xlabel('Real axis'), ylabel('Imaginary axis');


    




