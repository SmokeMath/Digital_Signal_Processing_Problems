% Define the frequency vector
f = [15 20 25 30 35 40 45 50 60 70 80 90 100 200 300 350 360 370 380 390 400 410 420 430 440 450 500 600 700 800]; % Hz

% Define the input and output signals (replace with your own data)
Vin_pp = 1; % Vpp
Vin_peak = Vin_pp/2; % V
Vin = Vin_peak * ones(size(Vout)); % V

Vout = [15.5 13.5 11.9 10.3 9.4 8.4 7.4 6.8 5.8 5.1 4.5 4.0 3.58 1.87 1.29 1.13 1.09 1.07 1.05 1.03 1.01 0.980 0.960 0.940 0.920 0.900 0.820 0.670 0.600 0.510];

% Calculate the magnitude of the transfer function
H_mag = abs(Vout ./ Vin);

% Plot the Bode magnitude plot using log scale for frequency
figure;
semilogx(f, 20*log10(H_mag));
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Bode Plot of Low Pass Filter');
grid on;