function [a,e1] = lms_sign(algo,x,u,M)
x=x';
real = [-0.9 -0.2]
L = length(x);
a = zeros(L,M);
e1 = zeros(L,M);
err = zeros(L,1);
temp = zeros(L,1);
for i = M+1:L
    temp(i) = a(i,:)*x(i-1:-1:i-M);
    err(i) = x(i) - temp(i);         
    if (algo == 0)
        a(i+1,:) = a(i,:) + u*err(i)*x(i-1:-1:i-M)';
    elseif (algo == 1)
        a(i+1,:) = a(i,:) + u*sign(err(i))*x(i-1:-1:i-M)';
    elseif (algo == 2)
        a(i+1,:) = a(i,:) + u*err(i)*sign(x(i-1:-1:i-M))';
    else 
        a(i+1,:) = a(i,:) + u*sign(err(i))*sign(x(i-1:-1:i-M))';
    end
    e1(i,:) = real-a(i,:);
end

end