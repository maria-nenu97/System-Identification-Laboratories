function [fi] = func(xid, N, n)
x=xid;
xmin=x(1);
xmax=x(N);

d=x(N)-x(1);
dist=d/(n-1);
b=dist;
c=xmin:dist:xmax;

for i=1:N
    for j=1:n
        fi(i, j)=exp((-(x(i)-c(j))^2)/(b^2);
    end
end

end


