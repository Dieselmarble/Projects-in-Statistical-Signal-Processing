clear all; close all; clc;
% 4.4
a = [1, 0.9, 0.2];
n = randn(1,3000);
x = filter(1, a, n);
%adaptive parameters
u = [0.01 0.05];
for i = 1:length(u)
    %model order is AR(2)
    [y, a, e] = arlms(x, u(i), 2);
    L = length(a);
    figure;
    plot(1:L, a.')
        grid on;
        xlim([1 L]);
        xlabel('Iteration');
        ylabel('Parameter Estimate');
        legend('a_1', 'a_2');
        title(sprintf('Estimated parameters for AR(2) process, \\mu=%1.2f', u(i))); 
end
    