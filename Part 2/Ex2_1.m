close all; clear all;
% a 1000-sample realisation of WGN 
x = randn(1, 1000);
% Create an unbiased estimation of the autocorrelation 
[acor, lag] = xcorr(x, 'unbiased');
% Plot th  results
figure;
subplot(1,2,1);
plot(lag,acor)
    %set axis limits;
    axis([-999 999 -0.5 1]);
    xlabel('\tau');
    ylabel('Correlation');
    title('ACF of 1000 long WGN sample');
    grid on;
%2.1.2
subplot(1,2,2);
plot(lag, acor);
    %set axis limits
    axis([-50 50 -0.5 1]);
    xlabel('Sample lag \tau');
    ylabel('Correlation');
    title('ACF of 1000 long WGN sample (zoomed in)');
    grid on;
print('-bestfit','BestFitFigure','-dpdf');