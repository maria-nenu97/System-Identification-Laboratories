function [fi] = gfct(x, N, n)
xmin=x(1);
xmax=x(N);
d=xmax-xmin; %domain
dist=d/(n-1);
b=dist;
c=xmin:b:xmax;

for i=1:N
    for j=1:n
        fi(i, j)=exp((-(x(i)-c(j)).^2)/(b^2));
    end
end

end

