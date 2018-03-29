close all; clear all; clc;
M = 4;
N = 1000;
% Function
a = rp1(M,N);
b = rp2(M,N);
c = rp3(M,N);
ma = mean(a.');
sa = std(a.');
mb = mean(b.');
sb = std(b.');
mc = mean(c.');
sc = std(c.');
i=[1:1:M];
figure;
subplot(2,3,1);
stem(i,ma);
    title('Mean for Process rp1');
    xlabel('realisation');
    ylabel('Mean amplitude');
    grid on;

subplot(2,3,4);
stem(i,sa);
    title('Standard Deviation for Process rp1');
    xlabel('realisation');
    ylabel('Standard deviation amplitude');
    grid on;
    
% Function RP2

subplot(2,3,2);
stem(i,mb);
    title('Mean for Process rp2');
    xlabel('realisation');
    ylabel('Mean amplitude');
    grid on;
    
subplot(2,3,5);
stem(i,sb);
    title('Standard Deviation for Process rp2');
    xlabel('realisation');
    ylabel('Std dev amplitude');
    grid on;
    
% Function RP3

subplot(2,3,3);
stem(i,mc);
    title('Mean for Process rp3');
    xlabel('realisation');
    ylabel('Mean amplitude');
    grid on;
    
subplot(2,3,6);
stem(i,sc);
    title('Standard Deviation for Process rp3');
    xlabel('realisation');
    ylabel('Standard Deviation amplitude');
    grid on;  
    
print('-bestfit','BestFitFigure','-dpdf')
    