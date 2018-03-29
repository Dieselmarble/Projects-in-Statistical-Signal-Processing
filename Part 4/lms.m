function [ y, e, w ] = lms( x, z, u, order )
N = length(x);
e = zeros(1,N);
y = zeros(1, N);
% number of coefficients = order+1
%w has diemension (order+1,N)
w = zeros(order+1,N);

for i = order+1:N
    y(i) = w(:,i).'*x(i:-1:i-order).';
    % error between output 
    e(i) = z(i) - y(i);
    % update w' = w + gain*correcting term
    w(:,i+1) = w(:,i) +  u*e(i)*x(i:-1:i-order).';
end
end