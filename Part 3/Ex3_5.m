close all; clear all; clc;
load('RR1.mat');
load('RR2.mat');
load('RR3.mat');
%remove the trend in the signal
%make them zero mean
rr1d = detrend(RRI_1);
rr2d = detrend(RRI_2);
rr3d = detrend(RRI_3);

%use periodogram function form Ex3_0
subplot(3,3,1)
PSD1 = pgm(rr1d');
N = length(rr1d');
freq1 = 0:1:N-1;
%normalised frequency
freq1 = freq1/N;
stem(freq1,PSD1);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Periodogram of trail 1')
grid on;
subplot(3,3,2)
PSD2 = pgm(rr2d');
N = length(rr2d');
freq2 = 0:1:N-1;
freq2 = freq2/N;
stem(freq2,rr2d);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Periodogram of trail 2')
grid on;
subplot(3,3,3)
PSD3 = pgm(rr3d');
N = length(rr3d');
freq3 = 0:1:N-1;
freq3 = freq3/N;
stem(freq3,rr3d);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Periodogram of trail 3')
grid on;

%---------------------------------------------%
%average periodogram
rr1d=[rr1d,0];
buffer = reshape(rr1d,34,[]);
PSD = zeros(34,50);
%Calculate 8 PSDs 
for i = 1:1:34
    q = buffer(i,:);
    PSD(i,:) = pgm(q');
end
N = 50;
freq = 0:1:N-1;
freq = freq/N;
Avg = mean(PSD);
subplot(3,3,4)
stem(freq, Avg);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Average periodogram trail 1, 50 window length ')

rr2d = rr2d(1:1225);
buffer = reshape(rr2d,25,[]);
PSD = zeros(25,49);
%Calculate 8 PSDs 
for i = 1:1:25
    q = buffer(i,:);
    PSD(i,:) = pgm(q');
end
N = 49;
freq = 0:1:N-1;
freq = freq/N;
Avg = mean(PSD);
subplot(3,3,5)
stem(freq, Avg);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Average periodogram trail 2, 50 window length ')

rr3d = rr3d(1:1334);
buffer = reshape(rr3d,29,[]);
PSD = zeros(29,46);
%Calculate 8 PSDs 
for i = 1:1:29
    q = buffer(i,:);
    PSD(i,:) = pgm(q');
end
N = 46;
freq = 0:1:N-1;
freq = freq/N;
Avg = mean(PSD);
subplot(3,3,6)
stem(freq, Avg);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Average periodogram trail 3, 50 window length')

%window length 150s
%---------------------------------------------%
%average periodogram
rr1d=[rr1d,0,0,0,0];
buffer = reshape(rr1d,12,[]);
PSD = zeros(12,142);
%Calculate 8 PSDs 
for i = 1:1:12
    q = buffer(i,:);
    PSD(i,:) = pgm(q');
end
N = 142;
freq = 0:1:N-1;
freq = freq/N;
Avg = mean(PSD);
subplot(3,3,7)
stem(freq, Avg);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Average periodogram trail 1, 150 window length')

rr2d = rr2d(1:1224);
buffer = reshape(rr2d,8,[]);
PSD = zeros(8,153);
%Calculate 8 PSDs 
for i = 1:1:8
    q = buffer(i,:);
    PSD(i,:) = pgm(q');
end
N = 153;
freq = 0:1:N-1;
freq = freq/N;
Avg = mean(PSD);
subplot(3,3,8)
stem(freq, Avg);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Average periodogram trail 2, 150 window length ')

rr3d = rr3d(1:1332);
buffer = reshape(rr3d,9,[]);
PSD = zeros(9,148);
%Calculate 8 PSDs 
for i = 1:1:9
    q = buffer(i,:);
    PSD(i,:) = pgm(q');
end
N = 148;
freq = 0:1:N-1;
freq = freq/N;
Avg = mean(PSD);
subplot(3,3,9)
stem(freq, Avg);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Average periodogram trail 3, 150 window length ')


