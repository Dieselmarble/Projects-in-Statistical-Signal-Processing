function [psd] = pgm(x)
    N = length(x);
    psd = zeros(N,1);
    %Perform DFT( for every f, sum over n)
    for f = 0:1:N-1
        n = [0:1:N-1];
        n = n';
        periodogram = exp(-1i*2*pi*f*n/N);
        psd(f+1) = (abs(x'*periodogram).^2)/N;
    end
    
   
    
    
   