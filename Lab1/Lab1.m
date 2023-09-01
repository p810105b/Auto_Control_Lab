% Problem 1
%{
     1 2 3         9 8 7
A =  4 5 6    B =  6 5 4
     7 8 9         3 2 1
%}

A = [1,2,3 ; 4,5,6 ; 7,8,9];
B = [9,8,7 ; 6,5,4 ; 3,2,1];

% (a) : A + B
disp('Problem 1(a)')
ans1_a = A + B;
disp(ans1_a)

% (b) : A * B
disp('Problem 1(b)')
ans1_b = A * B;
disp(ans1_b)

% (c) : A^2
disp('Problem 1(c)')
ans1_c = A^2;
disp(ans1_c)

% (d) : B'
disp('Problem 1(d)')
ans1_d = B';
disp(ans1_d)

% Problem 2
% (a) : plot cos(x)
figure(1)
x = -pi : 0.1 : pi;
subplot(2,2,1)
plot(x, cos(x), '*y');
legend('cos(x)');
xlabel('x');
ylabel('cos(x)');
title('Problem 2 (a)');
grid on;

% (b) : plot sin(x)
subplot(2,2,2)
plot(x, sin(x), '*y');
legend('sin(x)');
xlabel('x');
ylabel('sin(x)');
title('Problem 2 (b)');
grid on;

% (c) : plot cos(x) and sin(x)
subplot(2,2,3)
plot(x, cos(x), '*y', x, sin(x), '+k');
legend('cos(x)', 'sin(x)');
xlabel('x');
ylabel('y');
title('Problem 2 (c)');
grid on;

% (d) : plot e^(-x)
subplot(2,2,4)
plot(x, exp(-x), '+k');
legend('e^(-x)');
xlabel('x');
ylabel('y');
title('Problem 2 (d)');
grid on;

% (e, f) : mesh plot and surface plot
x = -8 : 0.1 : 8;
y = -8 : 0.1 : 8;
[xx, yy] = meshgrid(x, y);
zz = yy.*sin(xx) - xx.*cos(yy);

figure(2)
mesh(xx, yy, zz);
xlabel('x');
ylabel('y');
zlabel('z');
title('Problem 2 (e)');

figure(3)
surf(xx, yy, zz);
xlabel('x');
ylabel('y');
zlabel('z');
title('Problem 2 (f)');

% Problem 3
% (a) 3x3 random integer matrix(1 ~ 6)
disp('Problem 3(a)')
ans3_a = randi(6,3,3);
disp(ans3_a)

% (b) 3x3 identity matrix
disp('Problem 3(b)')
ans3_b = eye(3);
disp(ans3_b)

% (c) A + B
disp('Problem 3(c)')
ans3_c = ans3_a + ans3_b;
disp(ans3_c)

% (d) main diagonal of (c)
disp('Problem 3(d)')
ans3_d = diag(ans3_a + ans3_b, 0);
disp(ans3_d)

% Problem 4 
disp('Problem 4')
score = input('enter your score : ');
if score > 100 || score < 0
    disp('Error score');
else
    switch floor(score/10)
    case 10
    disp('Your grade is A');   
    case 9
    disp('Your grade is A');
    case 8
    disp('Your grade is B');
    case 7
    disp('Your grade is C');
    otherwise
    disp('Your grade is Fall');
    end
end
fprintf('\n')

% Problem 5
disp('Problem 5')
n = 1;
summation = 1;
while n < 999
    n = n + 1;
    summation = summation + n;
end
X = sprintf('1+2+3+...+999 = %d', summation);
disp(X);
fprintf('\n')

% Problem 6
disp('Problem 6')
temperatures = [];
for n = 1 : 12
    temperatures = [temperatures, randi([25, 30])];
end
% temperatures = randi([25, 30], 1,12);
disp('The temperatures of each month')
disp(temperatures)
figure(4)
bar(temperatures)
xlabel('month');			
ylabel('temperature');
title('Problem 6');