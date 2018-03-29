clear all; close all; clc;
load voice_recordings.mat;     
offset = 3.8e4;
a = a(offset:offset+1000);
mu = 0.01;
order=5;
figure
set(gcf,'Color','w')
subplot(2,2,1)
[y,par,e1] = arlms(a',mu,order);
plot(par.','LineWidth',2)
title('No Sign')
xlabel('Iteration')
ylabel('Parameter estimate')

xlim([0 1000])
grid on
subplot(2,2,2)
[par,e2] = sign_speech(1,a,mu,order);
plot(par,'LineWidth',2)
title('Signed error')
xlabel('Iteration')
ylabel('Parameter estimate')

xlim([0 1000])
grid on
subplot(2,2,3)
[par,e3] = sign_speech(2,a,mu,order);
plot(par,'LineWidth',2)
title('Signed regressor')
xlabel('Iteration')
ylabel('Parameter estimate')

xlim([0 1000])
grid on
subplot(2,2,4)
[par,e4] = sign_speech(3,a,mu,order);
plot(par,'LineWidth',2)
title('Sign sign')
xlabel('Iteration')
ylabel('Parameter estimate')

xlim([0 1000])
grid on
