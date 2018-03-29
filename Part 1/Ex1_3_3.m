close all; clear all; clc;
% Generate 1000 samples
y = rp1(1, 1000);
y1 = diff(y);
% Run pdf function
subplot(1,2,1);
pdf(y1(1:500));
title('pdf of first half of samples differentiated');

subplot(1,2,2);
pdf(y1(501:999));
title('pdf of last half of samples differentiated');

print('-bestfit','BestFitFigure','-dpdf')
