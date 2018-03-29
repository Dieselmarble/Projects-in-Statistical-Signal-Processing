close all ; clear all; clc;
load voice_recordings.mat;             
p=5;  %AR process order;
u=5; %adaptation gain
offset = 3.8e4;
a = a(offset:offset+1000);
[ y, ap, error ] = arlms( a', u, p ); 
L = length(ap);
%plot coeficents evolution
figure
plot(1:L,ap.','LineWidth',2)
grid on;
xlim([1 L]);
title('Weights evolution')
legend('a_1', 'a_2','Location','southeast')
xlabel('Iteration')
ylabel('Weights')

%plot prediction and input
figure
hold on
plot(a);
plot(y, 'r');
legend('Input', 'Prediction','Location','southeast')
hold off
title('Prediction')
xlabel('Iteration')
ylabel('Amplitude')

%plot error
figure
plot(1:length(e), e.^2);
ylim([0 0.01]);
title('Error evolution')
xlabel('Iteration')
ylabel('Square Error')



