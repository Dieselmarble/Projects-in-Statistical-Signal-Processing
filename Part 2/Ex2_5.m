close all ;clear all; clc;
%sampling frequency for RRI is 4Hz, recodred from 'RRI2mat' file
fs = 4;
load('RR1.mat');
load('RR2.mat');
load('RR3.mat');
h1 = RRI_1/60;
N = length(RRI_1);
%heart rate in h1
for i = 1:N
    h1(i) = 1/h1(i);
end
%smooth the trend

in = 1;
for i = 1:N/10 
    he(i) = 0.6*sum(h1(in:in+9));
    in = in +10;
end
he = he/10;
figure;
%use pdf fucntion from part1 
subplot(1,3,1)
pdf(h1);
    title('PDE of original heart rates')
    xlabel('heart rate');
    ylabel('probability');
    
in = 1;
for i = 1:N/10 
    he2(i) = sum(h1(in:in+9));
    in = in +10;
end
he2 = he2/10;

subplot(1,3,2)
pdf(he2);
    title('PDE of averaged heart rates a = 1')
    xlabel('heart rate');
    ylabel('probability');
subplot(1,3,3)
pdf(he);
    title('PDE of averaged heart rates a = 0.6')
    xlabel('heart rate');
    ylabel('probability');
    
%autocorrelation sequence of three RRI    
%remove mean from data sequence
rr1d = detrend(RRI_1);
rr2d = detrend(RRI_2);
rr3d = detrend(RRI_3);
[acor1, lag1] = xcorr(rr1d, 'unbiased');
[acor2, lag2] = xcorr(rr2d, 'unbiased');
[acor3, lag3] = xcorr(rr3d, 'unbiased');
figure;
subplot(1,3,1)
    stem(lag1,acor1)
    xlim([1 50]);
    xlabel('\tau');
    ylabel('Correlation');
    title('ACF of trail 1');
    grid on;
subplot(1,3,2)
    stem(lag2,acor2)
    xlim([1 50]);
    xlabel('\tau');
    ylabel('Correlation');
    title('ACF of trail 2');
    grid on;
subplot(1,3,3)
    stem(lag3,acor3)
    xlim([1 50]);
    xlabel('\tau');
    ylabel('Correlation');
    title('ACF of trail 3');
    grid on;
%find optiaml AR oder for the heart rate sequence
figure;

L = length(rr1d);
for i = 1:5
    % Use estimation variance as the error
    % Accumulate log(error) in an vector
   [a, e] = aryule(rr1d, i);
   MDL(i) = log(e) + (i*log(L)/L);
   AIC(i) = (log(e) + 2*i/L);
   Error(i) = log(e);
end
[a, e, k] = aryule(rr1d, 5);
pacf = -k;
subplot(2,3,1)
stem(pacf,'filled')
xlabel('Lag')
ylabel('Partial ACF')
title('Partial Autocorrelation Sequence')
xlim([0 5])
uconf = 1.96/sqrt(288);
lconf = -uconf;
hold on
plot([1 15],[1 1]'*[lconf uconf],'r')
grid
subplot(2,3,4)
plot(MDL);
hold on;
plot(AIC, 'r','LineWidth',2);
plot(Error, 'g','LineWidth',2)
    xlim([1 5]);
    legend('MDL', 'AIC', 'Cumulative Squared Error');
    xlabel('Model Order');
    ylabel('Model Error');
    title('MDL, AIC and Cumulative Squared Error trail 1');
    grid on;
%------------------------------------------%
PCF = 1;
L = length(rr2d);
for i = 1:5
    % Use estimation variance as the error
    % Accumulate log(error) in an vector
   [a, e] = aryule(rr2d, i);
   MDL(i) = log(e) + (i*log(L)/L);
   AIC(i) = (log(e) + 2*i/L);
   Error(i) = log(e);
end
[a, e, k] = aryule(rr2d,5);
pacf = -k;
subplot(2,3,2)
stem(pacf,'filled')
xlabel('Lag')
ylabel('Partial ACF')
title('Partial Autocorrelation Sequence')
xlim([0 5])
uconf = 1.96/sqrt(288);
lconf = -uconf;
hold on
plot([1 15],[1 1]'*[lconf uconf],'r')
grid

subplot(2,3,5)
plot(MDL);
hold on;
plot(AIC, 'r','LineWidth',2);
plot(Error, 'g','LineWidth',2)
    xlim([1 5]);
    legend('MDL', 'AIC', 'Cumulative Squared Error');
    xlabel('Model Order');
    ylabel('Model Error');
    title('MDL, AIC and Cumulative Squared Error trail 2');
    grid on;
%-------------------------------%    
PCF = 1;
L = length(rr3d);
for i = 1:5
    % Use estimation variance as the error
    % Accumulate log(error) in an vector
   [a, e] = aryule(rr3d, i);
   MDL(i) = log(e) + (i*log(L)/L);
   AIC(i) = (log(e) + 2*i/L);
   Error(i) = log(e);
end
[a, e, k] = aryule(rr3d,5);
pacf = -k;
subplot(2,3,3)
stem(pacf,'filled')
xlabel('Lag')
ylabel('Partial ACF')
title('Partial Autocorrelation Sequence')
xlim([0 5])
uconf = 1.96/sqrt(288);
lconf = -uconf;
hold on
plot([1 15],[1 1]'*[lconf uconf],'r')
grid
subplot(2,3,6)
plot(MDL);
hold on;
plot(AIC, 'r','LineWidth',2);
plot(Error, 'g','LineWidth',2)
    xlim([1 5]);
    legend('MDL', 'AIC', 'Cumulative Squared Error');
    xlabel('Model Order');
    ylabel('Model Error');
    title('MDL, AIC and Cumulative Squared Error trail 3');
    grid on;
    