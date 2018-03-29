clear all; close all; clc;
% define a1 and a2 
% The subtractions and multiplications provide the range and scaling needed
a1 = -2.5 + 5*rand(1000,1);
a2 = -1.5 + 3*rand(1000,1);

% Define some empty vectors to store stable/unstsable a1 and a2 values
a1stable = [];
a2stable = [];
a1unstable = [];
a2unstable = [];

% for all of the length of the a1/a2 samples
% loop from 1 to 1000
for i = 1:length(a1)
    %WGN
    w = randn(1000, 1);
    % where the output of our filter is going
    x = zeros(1000, 1);
    % the first two values need assinging so the process can start
    x(1) = w(1);
    x(2) = w(2);
    % Loop through to calculate our filtered signal
    for j = 3:1000
        x(j) = a1(i)*x(j-1) + a2(i)*x(j-2)+ w(j);
    end
    
    %Convergent
    if(abs(x(1000)) < 5)
        a1stable = [a1stable a1(i)];
        a2stable = [a2stable a2(i)];
    else
    %Divergent
        a1unstable = [a1unstable a1(i)];
        a2unstable = [a2unstable a2(i)];
    end
    
end

% plot the results

plot(a1stable, a2stable, '^r')
hold on;
plot(a1unstable, a2unstable, '+')
hold off;

    legend('Convergent', 'Non-Convergent');
    xlabel('a1');
    ylabel('a2');
    title('Randomly generated processes to show the stability triangle');

plot(a1stable, a2stable, '*r')
hold on;
plot(a1unstable, a2unstable, '+')
hold off;

    legend('Convergent', 'Divergent');
    xlabel('a1');
    ylabel('a2');
    title('AR Stability Triangle');

