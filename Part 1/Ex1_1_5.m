clear all;
X_1 = randn(1000,1);
mean_1 = mean(X_1); %sample mean of 1000-sample realisation
std_1 = std(X_1); %standard deviation of 1000-sample realisation

X_2 = randn(1000,10);
mean_2 = mean(X_2);
std_2 = std(X_2);
figure;
subplot(2,2,1);
stem(mean_2,'o')
    title('Sample Mean');
    xlabel('Ensemble Realisation');
    ylabel('mean');

subplot(2,2,2)
stem(std_2,'o')
    title('Sample Standard Deviation');
    xlabel('Ensemble realisation');
    ylabel('standdard deviation');

subplot(2,2,3);
hist(X_1);
[counts,centers] = hist(X_1);
bar(centers,counts/1000);
hold on;
x = [-4:.1:4];
norm = normpdf(x,0,1)
plot(x,norm);
title('pdf of 1000 samples');
xlabel('x');
ylabel('Density');
legend('Actual pdf', 'Theoretical pdf', 'Location', 'SouthEast');
hold off;

subplot(2,2,4)
[counts,centers] = hist(X_2);
bar(centers,counts/1000);
hold on;
x = [-4:.1:4];
norm = normpdf(x,0,1)
plot(x,norm);
title('pdf of ten 1000 samples ensembles');
xlabel('x');
ylabel('Density');
legend('Actual pdf', 'Theoretical pdf', 'Location', 'SouthEast');
hold off;

print('-bestfit','BestFitFigure','-dpdf')