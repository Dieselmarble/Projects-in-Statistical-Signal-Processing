clear all; close all; clc;
load('NASDAQ.mat');
price = NASDAQ.Close;
date = NASDAQ.Date;
N = length(price);
figure;
plot(date, price);
    xlabel('Date');
    ylabel('Closing Price');
    title('NASDAQ index between June 2003 and Feb 2007');
    grid on;
    
%Normalize the price data    
normal = zscore(price);
   
% Calculate PCF
%1st element is 1
PCF = 1;
for i = 1:10
    % Use estimation variance as the error
    % Accumulate log(error) in an vector
   [a, e] = aryule(normal, i);
   PCF = [PCF a(i+1)];
   MDL(i) = log(e) + (i*log(N)/N);
   AIC(i) = (log(e) + 2*i/N);
   Error(i) = log(e);
end
[a, e, k] = aryule(normal, 10);
pacf = -k;
stem(pacf,'filled')
xlabel('Lag')
ylabel('Partial ACF')
title('Partial Autocorrelation Sequence')
xlim([0 10])
uconf = 1.96/sqrt(288);
lconf = -uconf;
hold on
plot([1 15],[1 1]'*[lconf uconf],'r')
grid

figure;

stem(0:10, PCF);
    xlabel('Lag');
    ylabel('Correlation');
    title('Partial ACF for sunspot series');  
    uconf = 1.96/sqrt(N);
    lconf = -uconf;
    hold on;
    plot([1 15],[1 1]'*[lconf uconf],'r');
    legend('PCF','confidence level');
    grid on;

figure;
plot(MDL);
hold on;
plot(AIC, 'r');
plot(Error, 'g')
    xlim([1 10]);
    legend('MDL', 'AIC', 'Cumulative Squared Error');
    xlabel('Model Order');
    ylabel('Model Error');
    title('MDL, AIC and Cumulative Squared Error');
    grid on;
    
