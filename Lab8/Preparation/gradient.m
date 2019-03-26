function [V] = gradient(E,epsilon,N)
s=0;
for k=1:N
    s=s+E(k)*epsilon(:,k);
end
V=s*(2/N);
end

