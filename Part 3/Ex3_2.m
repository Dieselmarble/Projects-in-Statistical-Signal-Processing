clear all; close all; clc;

%Part 3.2.1
x = randn(1064,1);
y = filter((1),[1 0.9],x);
figure
[acor, lag] = xcorr(y, 'unbiased');
stem(lag,acor);
xlim([0 20]);
title('ACF of AR(1) process')
xlabel('lag');
ylabel('Correlation');

%remove first 40 samples 
y = y(41:end);

figure;
[h,w]= freqz((1),[1 0.9],512);
subplot(1,2,1)

PSD=pgm(y);
plot(w/(2*pi), PSD(1:512),'r')
hold on
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
axis([0 0.5 0 250]);
title('Periodogram and PSD for filtered WGN')
xlabel('Normalised Frequency');
ylabel('PSD');
legend('Estimated PSD', 'Theoretical PSD', 'Location', 'NorthWest');
grid
hold off

subplot(1,2,2)
PSD=pgm(y);
plot(w/(2*pi), PSD(1:512),'r');
hold on
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
axis([0.4 0.5 0 250]);
title('Periodogram and PSD for filtered WGN zoomed')
xlabel('Normalised Frequency');
ylabel('PSD');
legend('Estimated PSD', 'Theoretical PSD', 'Location', 'NorthWest');
grid 
hold off


%Apply a hamming window
figure;
ham = hamming(1024);
New = conv(ham,PSD);
hold on
plot(w/(2*pi),New(1:512), 'r');
plot(w/(2*pi),abs(h).^2, 'b', 'LineWidth', 2);
title('periodogram after Hamming window');
xlabel('Normalised Frequency');
ylabel('PSD');
hold off

%3.2.4

% autocorrelation series
R = xcorr(y, 'unbiased');

% These are the two equations we need to work out our filter coefficients
% based on the sampele size, 1025 and 1024 are the right lag indexes
% because we only deal with 512 samples
a1 = -R(1025)/R(1024);
var1 = R(1024) + a1*R(1025);

exact = freqz(var1, [1, a1], 512);

% and plot model based frequency response and exact response  
figure;
hold on
plot(w/(2*pi), abs(exact).^2, 'k', w/(2*pi), abs(h).^2, 'b', 'LineWidth', 2 )
plot(w/(2*pi), PSD(1:512),'r');
    grid on
    title('PSD from different methods')
    xlabel('Normalised Frequency');
    ylabel('PSD (Magnitude)');
    legend('model based PSD', 'theoretical PSD', 'periodogram', 'Location', 'NorthWest');
    axis([0.4 0.5 0 250]);
hold off
