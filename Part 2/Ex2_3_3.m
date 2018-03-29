clear all; close all; clc;

load('sunspot.dat')
sunspotdata = sunspot(:, 2);
normal = zscore(sunspotdata);
i = 10;
% Calculate PCF, insert new PCF throughout oiterations
a = aryule(sunspotdata, i);
out = aryule(normal, i);

[a, e, k] = aryule(normal, 50);
pacf = -k;
stem(pacf,'filled')
xlabel('Lag')
ylabel('Partial ACF')
title('Partial Autocorrelation Sequence')
xlim([0 50])
uconf = 1.96/sqrt(288);
lconf = -uconf;
hold on
plot([1 15],[1 1]'*[lconf uconf],'r')


