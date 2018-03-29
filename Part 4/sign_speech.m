function [ a err ] = sign_speech( algo,x,u,order )
%SIGN_SPEECH Summary of this function goes here
%   Detailed explanation goes here
N = length(x);
a = zeros(N,order);
e1 = zeros(N,order);
err = zeros(N,1);
temp = zeros(N,1);
for i = order+1:N
    temp(i) = a(i,:)*x(i-1:-1:i-order);
    err(i) = x(i) - temp(i);         
    if (algo == 0)
        a(i+1,:) = a(i,:) + u*err(i)*x(i-1:-1:i-order)';
    elseif (algo == 1)
        a(i+1,:) = a(i,:) + u*sign(err(i))*x(i-1:-1:i-order)';
    elseif (algo == 2)
        a(i+1,:) = a(i,:) + u*err(i)*sign(x(i-1:-1:i-order))';
    else 
        a(i+1,:) = a(i,:) + u*sign(err(i))*sign(x(i-1:-1:i-order))';
    end
end

end

