close all; clear all; clc;
X_2 = rand(1000,10);
%sample mean and sample standard deviation of ten 1000 ensembles
a = mean(X_2);
b = std(X_2)
figure;
subplot(1,2,1);
stem(a,'o')
    title('Sample Mean');
    xlabel('Ensemble realisation');
    ylabel('mean');
    grid on;
subplot(1,2,2);
stem(b, 'o');
    title('Sample Standard Deviation');
    xlabel('Ensemble realisation');
    ylabel('standdard deviation');

    grid on;
print('-bestfit','BestFitFigure','-dpdf')