clear all; close all; clc;

load('sunspot.dat')
sunspotdata = sunspot(:, 2);
sunspotdata = zscore(sunspotdata);
N = length(sunspotdata);

MDL = [];
AIC = [];
Error = [];

for i = 1:20
    % Use estimation variance as the error
    % Accumulate log(error) in an vector
   [a, e] = aryule(sunspotdata, i);
   MDL(i) = log(e) + (i*log(N)/N);
   AIC(i) = (log(e) + 2*i/N);
   Error = [Error log(e)];
end

figure;
plot(MDL);
hold on;
plot(AIC, 'r');
plot(Error, 'g')
    xlim([1 20]);
    legend('MDL', 'AIC', 'Cumulative Squared Error');
    xlabel('Model Order');
    ylabel('Model Error');
    title('MDL, AIC and Cumulative Squared Error');
    grid on;


