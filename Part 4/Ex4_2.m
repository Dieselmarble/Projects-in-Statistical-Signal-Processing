close all; clear all; clc;
%Ex 4.2
% 1000sample random sequence
x = randn(1,1000);
% 4th order filter
% Filter it x 
y = filter([1 2 3 2 1], 1, x);
n = 0.1*randn(1,1000); 
z = y + n;
u = [0.002,0.01,0.08,0.5];

for k = 1:length(u)
    %apply LMS on Wiener filter
    [ y, e, w ] = lms(x,z,u(k),4);
    N =  length(w(:,1));
    colours = ['b', 'r', 'g', 'c', 'm'];
    % Plot the different coefficients
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
    figure;
    plot(1:length(e), e.^2);
        grid
        ylabel('Square Error');
        xlabel('Iteration');
        title(sprintf('time evolution of estimated square error, \\mu=%1.3f', u(k)));
end