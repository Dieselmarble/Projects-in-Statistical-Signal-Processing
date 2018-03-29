close all; clear all; clc;
N = 10;
n = [0:1:N-1];

f0 = 0.05
x = cos(2*pi*f0*n);
N = length(x);
[pxx,w] = periodogram(x);
hold on;
plot(w/(2*pi),6*pxx,'LineWidth',2)
%Now plot exact MLE
M=[];
for f = 0:0.01:0.5
    x = cos(2*pi*f*n);
    x = x';
    c = cos(2*pi*f0*n);
    s = sin(2*pi*f0*n);
    H = [c',s'];
    temp = inv(H'*H);
    MLE = x'*H*temp*H'*x;
    M = [M,MLE];
end
f=[0:0.01:0.5]
plot(f,M,'LineWidth',2);
hold off;
legend('periodogram','MLE')
grid
xlabel('frequency')
ylabel('objective function')
title('Periodogram vs MLE f_0=0.25')
