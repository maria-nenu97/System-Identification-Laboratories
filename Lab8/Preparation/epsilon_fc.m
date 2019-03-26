function [eps, derivative, sum1, sum2] = epsilon_fc(teta, u, y)
sum1=0;
sum2=0;

f=teta(1,1);
b=teta(2, 1);
derivative(1,:)=[0 0];
eps(1)=y(1);

for k=2:length(u)
    eps(k)=-f*eps(k-1)+y(k)-b*u(k-1)+f*y(k-1);
    derivative(1,k)=-derivative(k-1)+y(k-1);
    derivative(2,k)=-u(k-1);
    sum1=sum1 +eps(k)*derivative(:,k);
    sum2=sum2 + derivative(:,k)*derivative(:,k)';
end
end
