function [eps,der,sum1,sum2] = eroare(teta,u,y)
f = teta(1,1);
b = teta(2,1);
der(:,1)=[0 0];
sum1 = 0;
sum2 = 0;
eps(1) = y(1);

for k = 2: length(u)
    eps(k) = -f*eps(k-1) +y(k) - b*u(k-1) + f* y(k-1);
    der(1,k)= -der(k-1) + y(k-1);
    der(2,k)= - u(k-1);
    sum1=sum1 + eps(k)*der(:,k);
    sum2=sum2 + der(:,k)*der(:,k)';
end

