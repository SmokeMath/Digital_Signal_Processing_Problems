% Define a sample input sequence (you can change this as needed)
n = -10:10;  % Define the range of n
x = sin(n);  % Example input sequence, you can replace this with your own data

% Define the systems
% (a) y[n] = x[-n] (Time-flip)
y_a = x(end:-1:1);

% (b) y[n] = log(|x[n]|) (Log-magnitude)
y_b = log(abs(x));

% (c) y[n] = x[n] ? x[n ? 1] (First-difference)
y_c = diff([0, x]);

% (d) y[n] = round{x[n]} (Quantizer)
y_d = round(x);

% Create a 2x2 subplot for each system
subplot(2, 2, 1);
stem(n, y_a, 'filled');
title('(a) Time-flip');
xlabel('n');
ylabel('y[n]');

subplot(2, 2, 2);
stem(n, y_b, 'filled');
title('(b) Log-magnitude');
xlabel('n');
ylabel('y[n]');

subplot(2, 2, 3);
stem(n, y_c, 'filled');
title('(c) First-difference');
xlabel('n');
ylabel('y[n]');

subplot(2, 2, 4);
stem(n, y_d, 'filled');
title('(d) Quantizer');
xlabel('n');
ylabel('y[n]');

% Adjust the subplot layout
sgtitle('Plot of Different Systems');