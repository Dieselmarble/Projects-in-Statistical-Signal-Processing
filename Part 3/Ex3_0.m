clear all; close all; clc;

% 3.0
%128 sample WGN
x_128 = randn(128,1);
PSD_128 = pgm(x_128);
N = length(x_128);
freq = 0:1:N-1;
freq_128 = freq/N;

figure;
subplot(2,3,1);
stem(freq_128, PSD_128);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('PSD estimation 128-sample WGN')
grid on;

%256 sample WGN
x_256 = randn(256,1);
PSD_256 = pgm(x_256);
N = length(x_256);
freq = 0:1:N-1;
freq_256 = freq/N;

subplot(2,3,2);
stem(freq_256, PSD_256);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('PSD estimation 256-sample WGN')
grid on;

%512 sample WGN
x_512 = randn(512,1);
PSD_512 = pgm(x_512);
N=length(x_512);
freq = 0:1:N-1;
freq_512 = freq/N;
subplot(2,3,3);
stem(freq_512, PSD_512);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('PSD estimation 512-sample WGN')
grid on;

%3.1.1
%zero phase FIR filter 
a = 1;
b = 0.2*[1,1,1,1,1];
y_128 = filtfilt(b,a,PSD_128);
y_256 = filtfilt(b,a,PSD_256);
y_512 = filtfilt(b,a,PSD_512);
subplot(2,3,4);
stem(freq_128, y_128);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('PSD estimation filtered 128-sample WGN')
subplot(2,3,5);
stem(freq_256, y_256);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('PSD estimation filtered 256-sample WGN')
subplot(2,3,6);
stem(freq_512, y_512);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('PSD estimation filtered 512-sample WGN')

