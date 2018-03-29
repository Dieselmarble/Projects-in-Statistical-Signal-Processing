function [ d, bins ] = pdf(v)
% split the data in to 100 bins
[elements, centres] = hist(v, 100);
% Divide the different 'bar' by the number of samples
% This is what creates the 'density' rather than a histogram.
d = elements/length(v);
bins = centres;
% Now let's plot what we have computed with a bar chart
bar(bins, d, 'BarWidth', 1);
    xlabel('x');
    ylabel('Probability Density');
end
