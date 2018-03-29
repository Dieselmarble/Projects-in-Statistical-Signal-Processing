close all; clear all;
% a 1000-sample realisation of WGN denoted by x
x = randn(1, 1000);
%filter by MA filter
a = ones(9,1);
[h,t] = impz(a,1);
w = conv(h,h);
y = filter(a,[1],x);
% auto-correlation for y
[ycor, lag] = xcorr(y, 'unbiased');
% Plot th  results
subplot(1,2,1);
stem(-20:20, ycor(980:1020));
    xlabel('Sample lag \tau');
    ylabel('Correlation');
    title('ACF of WGN samples after MA filter');
    grid on;
subplot(1,2,2);
plot(w);
    xlabel('Sample lag \tau');
    ylabel('Correlation');
    title('ACF of a MA process');
    grid on;
print('-bestfit','BestFitFigure','-dpdf');