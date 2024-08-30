% Define the frequency and gain vectors from the table
freq = [100,300,1000,3000,10000,30000,100000,300000,1000000,3000000,10000000];
gain = [2.01000000000000,2,2.01000000000000,2.02000000000000,2,0.980000000000000,0.216000000000000,0.133000000000000,0.0270000000000000,0.0200000000000000,0.0120000000000000];

% Create a transfer function object using the vectors
sys = tf(10^(mean(gain)/20), [1/(2*pi*freq(1)), 1]);

% Add poles and zeros to the transfer function
for i=2:length(freq)
    sys = sys * tf([1/(2*pi*freq(i)), 1], [1/(2*pi*freq(i-1)), 1]);
end

% Plot the bode plot for the transfer function
[mag, phase, wout] = bode(sys);
mag_db = 20*log10(squeeze(mag));
wout_hz = wout/(2*pi);
figure;
semilogx(wout_hz, mag_db, 'LineWidth', 2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Bandwidth and Frequency Response (Gain = -2) ');

% Plot the -3dB and 0dB frequencies on the bode plot
hold on;
freq_3db = interp1(mag_db, wout_hz, -3);
freq_0db = interp1(mag_db, wout_hz, 0);
plot(freq_3db, -3, 'ro', 'LineWidth', 2);
plot(freq_0db, 0, 'go', 'LineWidth', 2);

% Add text for the -3dB and 0dB frequencies
text(freq_3db, -4, sprintf('%.2f Hz', freq_3db), 'HorizontalAlignment', 'center');
text(freq_0db, 1, sprintf(': %.2f Hz', freq_0db), 'HorizontalAlignment', 'center');

% Add legend
legend({'Frequency Response', 'Crossover (0dB): 35.57 Hz', 'Break (-3dB): 76.88 Hz'}, 'Location', 'SouthWest');