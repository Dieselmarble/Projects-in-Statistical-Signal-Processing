close all; clear; clc;

%3.1.2
% Generate our WGN
x = randn(1,1024);
% divide the vector into eight 128-sample segments
buffer = reshape(x,8,[]);
%initialize a 8X128 matrix storing PSD data
PSD = zeros(8,128);
%Calculate 8 PSDs 
for i = 1:1:8
    q = buffer(i,:);
    PSD(i,:) = pgm(q');
end
V = var(PSD')
%3.1.3
N = 128;
freq = 0:1:N-1;
freq = freq/N;
Avg = mean(PSD);
stem(freq, Avg);
xlabel('Normalised frequency')
ylabel('Estimated PSD')
title('Average periodogram over 8 segments ')







