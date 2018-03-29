clear all; close all; clc;
%import bioma.data.*;
load('NASDAQ.mat');
price = NASDAQ.Close;
normal = zscore(price);
%AR(1) Process
[a, e] = aryule(normal, 1);
%number of data points 
CRLB_1 = zeros(20,20);
CRLB_2 = zeros(20,20);
i = 1;
j = 1;
k = 1;
for N = 1:50:1001
    %x is driving noise variance
    for x = 1001:-50:1
        %CRLB1
        CRLB_1(i,j) = 2*x.^2/N;
        j = j+1;
    end
    j = 1;
    for a1 = 1.0:-0.1:-1
        %CRLB2
        CRLB_2(i,k) = (1 - (a1)^2)/N;
        k = k+1;
    end
   k = 1;
   i = i+1;
end
N = [1:50:1001];
X = [1001:-50: 1];
A1 = [1.0:-0.1:-1];
%plot heatmap
h = heatmap(N,X,CRLB_1)
caxis(h,[1 2000]);
    xlabel('number of data points N');
    ylabel('driving noise variance Var(\sigma)');
    title('CRLB for estimatior \sigma ^2');
%colorbar;
figure;
h2 = heatmap(N,A1,CRLB_2)
caxis(h2,[0 3.3e-3]);
    xlabel('number of data points N');
    ylabel('AR(1) coefficients a1');
    title('CRLB for estimator a1');
