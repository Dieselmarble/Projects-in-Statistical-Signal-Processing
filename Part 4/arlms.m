function [ y, a, e ] = arlms(x, u, order)
N = length(x);
y = zeros(1,N);
e = zeros(1,N);
a = zeros(order,N);
for i = order+1:N
    y(i) = a(:,i).'*x(i-1:-1:i-order).';  
    e(i) = x(i) - y(i);    
    a(:,i+1) = a(:,i) + u*e(i)*x(i-1:-1:i-order).';
end
end

