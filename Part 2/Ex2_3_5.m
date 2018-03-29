clear all; close all; clc;

load('sunspot.dat')
sunspotdata = sunspot(:, 2);
sunspotdata = zscore(sunspotdata);
%different order Yule Walker
a1 = aryule(sunspotdata,1);
a2 = aryule(sunspotdata,2);
a10 = aryule(sunspotdata,10);

%reverse coefficients
a1 = -a1;
a2 = -a2;
a10 = -a10;
a1(1) = 1;
a2(1) = 1;
a10(1) = 1;
% Use first 10 sets of data to train the model 
x1 = sunspotdata(1:10);
x2 = sunspotdata(1:10);
x10 = sunspotdata(1:10);
AC = sunspotdata(1:20);
% predict next 10 years
for i = 1:10
    x1(i+10) = a1(2)*x1(i+9);
    x2(i+10) = a2(2)*x2(i+9) + a2(3)*x2(i+8);
    x10(i+10) = a10(2)*x10(i+9) + a10(3)*x10(i+8) + ...
    a10(4)*x10(i+7) + a10(5)*x10(i+6) + a10(6)*x10(i+5)...
    + a10(7)*x10(i+4) + a10(8)*x10(i+3) + a10(9)*x10(i+2)...
    + a10(10)*x10(i+1) + a10(11)*x10(i);
end
figure;
hold on;
range = 1:20;
plot(range, x1,'b','LineWidth',2);
plot(range, x2, 'c','LineWidth',2);
plot(range, x10, 'g','LineWidth',2);
plot(range, AC, 'r','LineWidth',2);
hold off;
    grid on;
    legend('AR(1)', 'AR(2)', 'AR(10)', 'Actual', 'Location', 'North');
    xlim([0 20]);
    xlabel('Prediction Horizon (Years)');
    ylabel('No of Sunspots');
    title('Actual and Estimated Sunspots, based on varying order AR models');