function [FI] = input(xid,N, n)

x=xid;
xmin=x(1);
xmax=x(N);

d=x(N)-x(1); %domain
dist=d/(n-1); %distance
b=dist;
c=xmin:dist:xmax; 

for k=1:N
    for j=1:n;
        FI(k, j)=exp((-(x(k)-c(j))^2)/(b^2));
    end
end
end

