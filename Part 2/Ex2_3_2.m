clear all; close all; clc;

load('sunspot.dat')
sunspotdata = sunspot(:, 2);

% original signal
figure;
plot(sunspot(:,1), sunspot(:, 2));
    xlabel('Year');
    ylabel('Number of sunspots');
    title('Sunspot Series');
    grid on;

figure;
% The first set of data, for N = 5
[ACF_5,lag] = xcorr(sunspotdata(1:6), 'unbiased');
subplot(3, 1, 1);
stem(lag, ACF_5);
    title('Sunspots Autocorrelation, N=5');
    xlabel('Lag');
    ylabel('Correlation');
    grid on;

% Now for N = 20
[ACF_20,lag] = xcorr(sunspotdata(1:20), 'unbiased');
subplot(3, 1, 2);
stem(lag, ACF_20);
    title('Sunspots Autocorrelation, N=20');
    xlabel('Lag');
    ylabel('Correlation');
    grid on;

% And for N = 250. 
[ACF_250, lag] = xcorr(sunspotdata(1:251), 'unbiased');
subplot(3, 1, 3);
stem(lag, ACF_250)
    title('Sunspots Autocorrelation, N=250');
    xlabel('Lag');
    ylabel('Correlation');
    grid on;

%Zero mean 
figure;
subplot(3, 1, 1)
[y, lag] = xcorr(sunspotdata(1:6) - mean(sunspotdata(1:6)), 'unbiased');
stem(lag, y)
    title('Zero Mean Sunspots Autocorrelation, N=5');
    xlabel('Lag');
    ylabel('Correlation');
    grid on;

    
subplot(3, 1, 2)
[y, lag] = xcorr(sunspotdata(1:21) - mean(sunspotdata(1:21)), 'unbiased');
stem(lag, y)
    title('Zero Mean Sunspots Autocorrelation, N=20');
    xlabel('Lag');
    ylabel('Correlation');
    grid on;

subplot(3, 1, 3)
[y, lag] = xcorr(sunspotdata(1:251) - mean(sunspotdata(1:251)), 'unbiased');
stem(lag, y, 'Marker', 'none')
    title('Zero Mean Sunspots Autocorrelation, N=250');
    xlabel('Lag');
    ylabel('Correlation');
    grid on;
    
