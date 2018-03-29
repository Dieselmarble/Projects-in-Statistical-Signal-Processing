close all; clear all; clc;
M = 100;
N = 100;
% Function
a = rp1(M,N);
b = rp2(M,N);
c = rp3(M,N);
figure;
subplot(2,3,1);
plot(mean(a));
    title('Mean for Process rp1');
    xlabel('time');
    ylabel('Mean amplitude');
    grid on;
subplot(2,3,4);
plot(std(a));
    title('Standard Deviation for Process rp1');
    xlabel('time');
    ylabel('Standard deviation amplitude');
    grid on;

% Function RP2
subplot(2,3,2);
plot(mean(b));
    title('Mean for Process rp2');
    xlabel('time');
    ylabel('Mean amplitude');
    grid on;
    
subplot(2,3,5);
plot(std(b));
    title('Standard Deviation for Process rp2');
    xlabel('time');
    ylabel('Std dev amplitude');
    grid on;
    
% Function RP3
subplot(2,3,3);
plot(mean(c));
    title('Mean for Process rp3');
    xlabel('time');
    ylabel('Mean amplitude');
    grid on;
    
subplot(2,3,6);
plot(std(c));
    title('Standard Deviation for Process rp3');
    xlabel('time');
    ylabel('Standard Deviation amplitude');
    grid on;   
print('-bestfit','BestFitFigure','-dpdf')