close all; clear all; clc;
%pdf of stationary-ergodic process rp3
% The three different lengths we will be testing
size = [ 100, 1000, 10000 ];

for i = 1:3
    
    % Generate the data from our samples
    data = rp3(1, size(i));
    
    % Specify where in the plot to go
    subplot(1,3,i);
    
    % Run our pdf function and 
    pdf(data);
    
    % Titles 
    t = sprintf('Estimated PDF, N = %i',size(i));
    title(t);
    % Add the theoretical line
    hl = refline(0, 1/100);
    set(hl, 'Color', 'r'); 
    
    legend('Estimated pdf', 'Theoretical pdf');
    
end

print('-bestfit','BestFitFigure','-dpdf')
