clear;
%Problem 2A)

%cutoff frequency is the frequency at which the normalized gain of the filter is –6 dB
%Freq must be smaller than 1

w_c=pi/3;
w_n=w_c/pi;

M_1=20;
M_2=50;
M_3=150;

%sidelobe attenuation for Dolph-Chebyshev window FIR

noise = wgn(1000,1,1);

che = chebwin(M_2+1,25);%needs to be 1 larger to have same length

h = fir1(M_2,w_n,"low",che);

[H, w_axis] = freqz(h, 1, 2048);%Matlab function to get frequency response
H_dB = 20*log10(abs(H));

hold on;
figure(1)
plot(w_axis/pi, H_dB);
xlabel("Frequency [Pi Rad/Sample]")
ylabel("Gain [dB]")
title("Frequency Response of M_1");
hold off;