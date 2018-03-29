clear all; close all; clc;
a = [1, 0.9, 0.2];
n = randn(1,5000);
x = filter(1, a, n);
mu = 0.001;
figure
set(gcf,'Color','w')
subplot(2,2,1)
[par,e1] = lms_sign(0,x,mu,2);
plot(par,'LineWidth',2)
title('No Sign')
xlabel('Iteration')
ylabel('Parameter estimate')
legend('a1','a2')
xlim([0 5000])
grid on
subplot(2,2,2)
[par,e2] = lms_sign(1,x,mu,2);
plot(par,'LineWidth',2)
title('Signed error')
xlabel('Iteration')
ylabel('Parameter estimate')
legend('a1','a2')
xlim([0 5000])
grid on
subplot(2,2,3)
[par,e3] = lms_sign(2,x,mu,2);
plot(par,'LineWidth',2)
title('Signed regressor')
xlabel('Iteration')
ylabel('Parameter estimate')
legend('a1','a2')
xlim([0 5000])
grid on
subplot(2,2,4)
[par,e4] = lms_sign(3,x,mu,2);
plot(par,'LineWidth',2)
title('Sign sign')
xlabel('Iteration')
ylabel('Parameter estimate')
legend('a1','a2')
xlim([0 5000])
grid on
%Plot error
figure
subplot(2,2,1)
plot(e1,'LineWidth',2)
title('No Sign')
xlabel('Iteration')
ylabel('Error')
grid on
subplot(2,2,2)
plot(e2,'LineWidth',2)
title('Signed error')
xlabel('Iteration')
ylabel('Error')
grid on
subplot(2,2,3)
plot(e3,'LineWidth',2)
title('Signed regressor')
xlabel('Iteration')
ylabel('Error')
grid on
subplot(2,2,4)
plot(e4,'LineWidth',2)
title('Sign sign')
xlabel('Iteration')
ylabel('Error')
grid on