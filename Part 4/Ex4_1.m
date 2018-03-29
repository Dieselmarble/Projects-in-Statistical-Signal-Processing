close all; clear; clc;
% 4.1
% 1000sample random sequence
x = randn(1,1000);
% 4th order filter
order = 4;
% Filter it x 
y = filter([1 2 3 2 1], 1, x);
m = mean(y);
s = std(y);
%normalise unknown system ooutput y
out = (y-m)/s;
%scale factor
n = 0.1*randn(1,1000);%standard deviation is 0.1
% generate z by adding noise to y
z = out + n;
% r_zx
r_zx = xcorr(z, x, 'unbiased');
% Readying the p_zx vector
p_zx = zeros(order, 1);
% Populating it from the centre of the correlation
for i = 1:order+1
    p_zx(i) = r_zx(999+i);
end
% Autocorrelation of x
r_xx = xcorr(x, 'unbiased');
% generate a toeplitz matrix
R_xx = toeplitz(r_xx(1000:1000+order));
% Now we find our w_opt values
w_opt = inv(R_xx)*p_zx;
%signal to noise ratio for signal z, in decibels 
SNR = snr(out, n);
%---------------------------------%
% 4.1.2
% Let's experiment with double the necessary cofficients
p_zx = zeros(2*order, 1);
for k = 1:2*order+1
    p_zx(k) = r_zx(999+k);
end
R_xx = toeplitz(r_xx(1000:1000+(2*order)));    
double_w_opts = inv(R_xx)*p_zx;
order = 4;
%Vector of noise variance to experiment with
stdd = [0.1,0.5,0.75,1,5,7.5,10];
% Matrices ready to store data in
save_snr = zeros(1,6);
w_opts = zeros(6,order+1);

for i = 1:length(stdd)
    x = randn(1,1000);
    y = filter([1, 2, 3, 2, 1], 1, x);
    m = mean(y);
    s = std(y);
    %normalise unknown system ooutput y
    out = (y-m)/s; 
    n = (stdd(i))*randn(1,1000);
    z = y + n;
    r_zx = xcorr(z, x, 'unbiased');
    p_zx = zeros(order, 1);
    for k = 1:order+1
        p_zx(k) = r_zx(999+k);
    end
    % Autocorrelation of x
    r_xx = xcorr(x, 'unbiased');
    R_xx = toeplitz(r_xx(1000:1000+order));
    % w_opt values
    w_opts(i,:) = inv(R_xx)*p_zx;
    save_snr(i) = snr(out, n);
end
plot(stdd,w_opts,'LineWidth',2)
xlabel('standard deviation');
ylabel('Wiener coefficients');
title('Wiener coefficients as a function of standard deviation');
grid
figure
plot(stdd,save_snr,'LineWidth',2)
xlabel('standard deviation');
ylabel('SNR');
title('SNR as a function of standard deviation');
grid

