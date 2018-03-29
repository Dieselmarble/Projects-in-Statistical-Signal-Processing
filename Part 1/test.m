close all; clear all; clc;
M = 4;
N = 1000;
% Function
a = rp1(M,N);
b = rp2(M,N);
c = rp3(M,N);

%sa = std(a.');
mb = mean(b.');
sb = std(b.');
mc = mean(c.');
sc = std(c.');
figure;
subplot(1,2,1);
autocorr(a(1,:))
    title('Mean for Process rp1');
    xlabel('realisation');
    ylabel('Mean amplitude');
    grid on;
subplot(1,2,2);
plot(cov(a))
    
% Function RP2
figure;
subplot(1,2,1);
autocorr(b(1,:))
    title('Mean for Process rp2');
    xlabel('realisation');
    ylabel('Mean amplitude');
    grid on;
subplot(1,2,2);
plot(cov(b))    
    
% Function RP3
figure;
subplot(1,2,1);
autocorr(c(1,:))
    title('Mean for Process rp3');
    xlabel('realisation');
    ylabel('Mean amplitude');
    grid on   
subplot(1,2,2);
plot(cov(c))