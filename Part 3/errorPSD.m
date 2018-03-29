        %Error function for periodogram
        error = abs(normped(1:145)- pxx);
        error = error.^2;
        MSE(i) = sum(error)/145;