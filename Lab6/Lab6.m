% Problem 1
G = tf([5], [1 2 25])
t = 0 : 0.1 : 10;
[y, t] = step(G, t);

plot(t, y, [0 10], [1 1],'--');
grid on;
xlabel('Time(sec)');
ylabel('y(t)');

% The final value of y is y(101), 1 + 10/0.1 = 101
steady_state_error = abs(y(101) - 1)
% steady state value for t → ∞
step(G)
grid on;

% Problem 2
for k = 5 : 0.1 : 5
    Controller = tf([10], [1 0]);
    Plant = tf([1], [1, k]);
    transfer_fnc = feedback(series(Controller, Plant), [1], -1);

    t = 0 : 0.1 : 5;    % simulation time seeting
    [y, t] = step(transfer_fnc, t);
    
    y_max = max(y);                % maximum value of y
    y_ss  = dcgain(transfer_fnc);  % steady state value of y = 1
    P_O =  (y_max - y_ss) / y_ss;  % percantage overshoot
    if (P_O > 0.01) & (P_O < 0.10) % 1% ~ 10% P.O.
        k, y_max, P_O, break
    end
end

plot(t, y, [0 5], [1 1],'--');
grid on;
xlabel('Time(sec)');
ylabel('y(t)');

% Vertify the steady state error is 0
steady_state_error = dcgain(transfer_fnc) - 1

