function [ y, e, w ] = nlms( x, z, u, order)
%constant epsilon in normalised LMS
ep = 1e-20;          
N = length(x);
e = zeros(1,N);
y = zeros(1, N);   
w = zeros(order+1,N); 

for i = order+1:N
    y(i) = w(:,i).'*x(i:-1:i-order).';
    % error between output 
    e(i) = z(i) - y(i);
    %adaptive gain
    xp = x(i:-1:i-order);
    mu = u/((xp*xp')+ep);
    % update w' = w + gain*correcting term
    w(:,i+1) = w(:,i) +  mu*e(i)*x(i:-1:i-order).';
end
end