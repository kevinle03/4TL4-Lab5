clear;
% Part 1: The truncation method of FIR design
%% (a) (b) (c) (d)
num_samples = 10000;
w_c = pi/3; % cutoff frequency
f_c = w_c/(2*pi);
t_id = 1; % ideal group delay
w = linspace(-pi,pi,num_samples);
M_values = [20, 50, 150]; % filter orders
noise = wgn(1000, 1, 1);
noise_DFT = fft(noise, num_samples);
figure;
plot(w,abs(noise_DFT));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Noise')
for M = M_values
    N = M + 1; % number of samples
    % design ideal filter
    H_id = exp(-1j*0.5*w*(N-1)); % ideal frequency response
    H_id(abs(w) > w_c) = 0; % set values after w_c to 0
    h_id = ifft(H_id); % ideal impulse response
    % truncation method
    n = 0:N-1;
    h = h_id(1:N); % truncation (rectangular window)
    figure;
    stem(n,h);
    xlabel('Time Index')
    ylabel('Impulse Response')
    title(['Impulse Response of the Designed Filter (M = ' num2str(M) ')'])
    
    H = fft(h, num_samples); % frequency response of truncated filter
    figure;
    plot(w,abs(H));
    xlabel('Frequency')
    ylabel('Frequency Response')
    title(['Frequency Response of the Designed Filter (M = ' num2str(M) ')'])
    figure;
    plot(w,unwrap(angle(H)));
    xlabel('Frequency')
    ylabel('Phase of Frequency Response')
    title(['Phase of Frequency Response of the Designed Filter (M = ' num2str(M) ')'])
    
    %design filter using firls()
    b = firls(M, [0, 1/3, 1/3, 1], [1, 1, 0, 0]); % filter design using firls
    freqz(b,1)
    % filter noise using conv()
    h_noise = conv(h, noise);
    H_noise = fft(h_noise, num_samples);
    figure;
    plot(w,abs(H_noise));
    xlabel('Frequency')
    ylabel('Frequency Response')
    title(['Frequency Response of Noise After Filter Using conv() (M = ' num2str(M) ')'])
    figure;
    plot(0:length(h_noise)-1,h_noise);
    xlabel('Time Index')
    ylabel('Amplitude')
    title(['Time Response of Noise After Filter Using conv() (M = ' num2str(M) ')'])
    % filter noise using filter()
    h_noise = filter(h, 1, noise);
    H_noise = fft(h_noise, num_samples);
    figure;
    plot(w,abs(H_noise));
    xlabel('Frequency')
    ylabel('Frequency Response')
    title(['Frequency Response of Noise After Filter Using filter() (M = ' num2str(M) ')'])
    figure;
    plot(0:length(h_noise)-1,h_noise);
    xlabel('Time Index')
    ylabel('Amplitude')
    title(['Time Response of Noise After Filter Using filter() (M = ' num2str(M) ')'])
end
%%  (e)
 