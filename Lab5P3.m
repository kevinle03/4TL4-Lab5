num_samples = 10000;
% impulse responses
h_2_pulse = [1, -1];
h_3_pulse = [1, -2, 1];
% frequency responses
w = linspace(0,2*pi,num_samples);
H_2_pulse = fft(h_2_pulse, num_samples);
H_3_pulse = fft(h_3_pulse, num_samples);
% plot
figure;
plot(w, abs(H_2_pulse))
xlabel('Frequency')
ylabel('Magnitude')
title('Frequency Response of Two-Pulse Canceller')

figure;
plot(w, abs(H_3_pulse))
xlabel('Frequency')
ylabel('Magnitude')
title('Frequency Response of Three-Pulse Canceller')