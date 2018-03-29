close all; clear; clc;
% 3.2.5
load('sunspot.dat')
sunspotdata = sunspot(:, 2);
% Create the zero mean version of the data
zms = sunspotdata - mean(sunspotdata);

% Take the periodogram of our sunspot data
ped = pgm(sunspotdata);
% periodogram fior zero mean sunspot data
normped = pgm(zms); 

% Subplot indexing
k = 1;
% Model Orders to test
for i = [ 1, 2, 10 ] 
   
    % find psd by Yule-Walker equations
	[pxx, w] = pyulear(sunspotdata, i, 288);
    [pxx1, w1] = pyulear(zms, i, 288);
    subplot(2,3,k)
        hold on;
        plot(w/(2*pi), ped(1:145));
        plot(w/(2*pi), pxx, 'r');
        hold off;
        xlim([0 0.25]); % Set this limit to view the area of interest
        xlabel('Normalised Frequency');
        ylabel('PSD (Magnitude)');
        t = sprintf('Sunspot estimation for AR(%i) process',i);
        title(t);
        legend('Sunspot Periodogram', 'Model based PSD')
        grid on;

    % Plot zero mean version 
    subplot(2,3,k+3)
        hold on;
        plot(w1/(2*pi), normped(1:145));
        plot(w1/(2*pi), abs(pxx1), 'r'); % Theoretical PSD
        hold off;
        xlim([0 0.25]);
        xlabel('Normalised Frequency');
        ylabel('PSD (Magnitude)');
        t = sprintf('Zero Mean sunspot estimation for AR(%i) process',i);
        title(t);
        legend('Sunspot Periodogram', 'Model based PSD')
        grid on;
        
        %Error function for periodogram
        error = abs(normped(1:145)- pxx);
        error = error.^2;
        MSE(i) = sum(error)/145;
        
    k = k + 1;
end


