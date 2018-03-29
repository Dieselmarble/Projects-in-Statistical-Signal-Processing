clear all; close all; clc;
% 4.3
% Initialise coefficients and signals
x = randn(1,1000);
y = filter([1 2 3 2 1], 1, x);
%scale noise 
n = 0.1*randn(1,1000);
z = y + n;
% apply normalised LMS
u = [0.25,0.5];

for k = 1:length(u)
    [y, e, w] = nlms(x,z,u(k),4);
    N = length(w(:,1));
    figure;
    hold on;
    for i = 1:N
        plot(1:length(w), w(i,:), 'LineWidth',2)
    end
    hold off;
        grid
        xlim([1 length(w)]);
        xlabel('Iteration');
        ylabel('Estimated value');
        title(sprintf('Estimated coefficient values, \\mu=%1.3f', u(k)));
end