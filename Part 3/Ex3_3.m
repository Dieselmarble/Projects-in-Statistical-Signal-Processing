%%
close all; clear all; clc;
load('sunspot.dat')
sunspotdata = sunspot(:, 2);
data = sunspotdata - mean(sunspotdata);
%data = zscore(sunspotdata);
%apply LSE approach on sunspot series
%m1 = ar(data,1,'ls');
m2 = ar(data,2,'ls');
%m3 = ar(data,3,'ls');
%m4 = ar(data,4,'ls');
%m5 = ar(data,5,'ls');
%m6 = ar(data,6,'ls');
%m7 = ar(data,7,'ls');
%m8 = ar(data,8,'ls');
%m9 = ar(data,9,'ls');
%m10 = ar(data,10,'ls');
MSE = [];
%approximation error against model order 
%find optimum mode order
for i = 1:10
    m = ar(data,i,'ls'); 
    y = compare(data,m,1);
    error = sum((y-data).^2)/288;
    MSE = [MSE error];
end
plot([1:10],MSE,'LineWidth',2);
xlabel('model order')
ylabel('Approximation error(MSE)')
title('Approximation error for different model order')
grid
%%
a = m2.A;
N = 1024;
PSD = abs(freqz(1,a,N,1)).^2;
f = (1:N)/N;
plot(f/2,20*log10(PSD),'LineWidth',2);
w = randn(N,1,1);
y = filter(1,a,w);
[Pxx,F] = pyulear(y,2,1024,1);
hold on
plot(F,20*log10(Pxx),'LineWidth',2)
xlabel('Normalised Frequency (Hz)')
ylabel('PSD (dB/Hz)')
legend('LSE PSD Estimate','pyulear PSD Estimate')
xlim([0 0.5])
title('PSD of AR(2)')
grid
%--approxiamtion error---%
%%
MSE = [];
for N = 10:5:250
    temp = data(1:N);
    m2 = ar(temp,2,'ls'); 
    y = compare(temp,m2,1);
    error = sum((y-temp).^2)/N;
    MSE = [MSE error];
end
plot([10:5:250],MSE,'LineWidth',2);
xlabel('Data length')
ylabel('Approximation error(MSE)')
title('Approximation error for AR(2)')
grid


