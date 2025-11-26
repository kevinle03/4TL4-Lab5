clear;
%Problem 2A)

%cutoff frequency is the frequency at which the normalized gain of the filter is –6 dB
%Freq must be smaller than 1

w_c=pi/3;
w_n=w_c/pi;
num_samples= 10000;
M_1=20;
M_2=50;
M_3=150;

%sidelobe attenuation for Dolph-Chebyshev window FIR



che = chebwin(M_1+1,25);%needs to be 1 larger to have same length

h = fir1(M_1,w_n,"low",che);

hold on;
figure(1)
freqz(h, 1, 2048)%Matlab function to get frequency response
title("Frequency Response of M_1 at 25 Sidelobe Attenuation");
hold off;

che = chebwin(M_1+1,100);%needs to be 1 larger to have same length

h = fir1(M_1,w_n,"low",che);


hold on;
figure(2)
freqz(h, 1, 2048)
title("Frequency Response of M_1 100 Sidelobe Attenuation");
hold off;

che = chebwin(M_1+1,50);%needs to be 1 larger to have same length

h = fir1(M_1,w_n,"low",che);

hold on;
figure(3)
freqz(h, 1, 2048);
title("Frequency Response of M_1 at 50 Sidelobe Attenuation");
hold off;

che = chebwin(M_2+1,100);%needs to be 1 larger to have same length

h = fir1(M_2,w_n,"low",che);


hold on;
figure(4)
freqz(h, 1, 2048);
title("Frequency Response of M_2 FIR");
hold off;

che = chebwin(M_3+1,100);%needs to be 1 larger to have same length

h = fir1(M_3,w_n,"low",che);


hold on;
figure(5)
freqz(h, 1, 2048);
title("Frequency Response of M_3 FIR");
hold off;

[b,a] = cheby2(M_1,100,w_n,"low");%needs to be 1 larger to have same length



hold on;
figure(6)
freqz(b,a)
title("Frequency Response of M_1 IIR");
hold off;

[h,t] = impz(b,a);

hold on;
figure(7)
plot(t,h);
xlabel("Samples")
ylabel("Amplitude")
title("Impulse Response of M_1 IIR");
hold off;

noise = wgn(1000,1,1);
w = linspace(-pi,pi,num_samples);
noise_DFT = fft(noise, num_samples);
figure(8);
hold on;
plot(w,abs(noise_DFT));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Noise')
hold off;

yz=conv(h,noise);
filter_noiseyz = fftshift(fft(yz, num_samples));
figure(9);
hold on;
plot(w,abs(filter_noiseyz));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Convolved Noise')
hold off;

figure(200);
hold on;
plot(0:length(yz)-1,yz);
xlabel('Time Index')
ylabel('Amplitude')
title('Time Response of Convolved Noise')
hold off;

y=filter(b,a,noise);
filter_noise = fftshift(fft(y, num_samples));
figure(10);
hold on;
plot(w,abs(filter_noise));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Filtered Noise')
hold off;

figure(201);
hold on;
plot(0:length(y)-1,y);
xlabel('Time Index')
ylabel('Amplitude')
title('Time Response of Filtered Noise')
hold off;

[b,a] = cheby2(M_2,100,w_n,"low");%needs to be 1 larger to have same length

hold on;
figure(11)
freqz(b,a)
title("Frequency Response of M_2 IIR");
hold off;

[h,t] = impz(b,a);

yz=conv(h,noise);
filter_noiseyz = fftshift(fft(yz, num_samples));
figure(12);
hold on;
plot(w,abs(filter_noiseyz));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Convolved Noise')
hold off;
figure(202);
hold on;
plot(0:length(yz)-1,yz);
xlabel('Time Index')
ylabel('Amplitude')
title('Time Response of Convolved Noise')
hold off;
hold on;
figure(13)
plot(t,h);
xlabel("Samples")
ylabel("Amplitude")
title("Impulse Response of M_2 IIR");
hold off;

y=filter(b,a,noise);
filter_noise = fftshift(fft(y, num_samples));
figure(14);
hold on;
plot(w,abs(filter_noise));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Filtered Noise')
hold off;

figure(203);
hold on;
plot(0:length(y)-1,y);
xlabel('Time Index')
ylabel('Amplitude')
title('Time Response of Filtered Noise')
hold off;
[b,a] = cheby2(M_3,100,w_n,"low");%needs to be 1 larger to have same length




hold on;
figure(15)
freqz(b,a)
title("Frequency Response of M_3 IIR");
hold off;

[h,t] = impz(b,a);

yz=conv(h,noise);
filter_noiseyz = fftshift(fft(yz, num_samples));
figure(16);
hold on;
plot(w,abs(filter_noiseyz));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Convolved Noise')
hold off;
figure(204);
hold on;
plot(0:length(yz)-1,yz);
xlabel('Time Index')
ylabel('Amplitude')
title('Time Response of Convolved Noise')
hold off;
hold on;
figure(17)
plot(t,h);
xlabel("Samples")
ylabel("Amplitude ")
title("Impulse Response of M_3 IIR");
hold off;

y=filter(b,a,noise);
filter_noise = fftshift(fft(y, num_samples));
figure(18);
hold on;
plot(w,abs(filter_noise));
xlabel('Frequency')
ylabel('Frequency Response')
title('Frequency Response of Filtered Noise')
hold off;

figure(205);
hold on;
plot(0:length(y)-1,y);
xlabel('Time Index')
ylabel('Amplitude')
title('Time Response of Filtered Noise')
hold off;


