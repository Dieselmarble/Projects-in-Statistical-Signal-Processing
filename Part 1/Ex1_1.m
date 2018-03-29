clear all;
X_1 = rand(1000,1);
mean_1 = mean(X_1); %sample mean of 1000-sample realisation
std_1 = std(X_1); %standard deviation of 1000-sample realisation

X_2 = rand(1000,10);
mean_2 = mean(X_2);
std_2 = std(X_2);

thremean = 0.5;
threstd = sqrt(1/12);

Bias_m1 = thremean - mean_1 ;
Bias_std1 = threstd - std_1;

Bias_m2 = thremean - mean_2 ;
Bias_std2 = threstd - std_2;

figure;
subplot(1,2,1);
stem(1:10, mean_2, 'filled');
    title('Mean');
    xlabel('Ensemble reealisation');
    ylabel('Bias');

subplot(1,2,2)
stem(1:10, std_2, 'filled');
    title('Standard Deviation');
    xlabel('Ensemble realisation');
    ylabel('Bias');

figure;
subplot(1,2,1);
[counts,centers] = hist(X_1);
bar(centers,counts/1000);
hline = refline([0 0.1]);
hline.Color = 'r';
title('pdf of 1000 samples');
xlabel('x');
ylabel('Density');
legend('Actual pdf', 'Theoretical pdf', 'Location', 'SouthEast');

subplot(1,2,2)
[counts,centers] = hist(X_2);
bar(centers,counts/1000);
hline = refline([0 0.1]);
hline.Color = 'r';
title('pdf of ten 1000 samples ensembles');
xlabel('x');
ylabel('Density');
legend('Actual pdf', 'Theoretical pdf', 'Location', 'SouthEast');


print('-bestfit','BestFitFigure','-dpdf')
 