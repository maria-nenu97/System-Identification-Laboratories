function [H] = hessian(epsilon,N)
s=0;
for k=1:N
    s=s+epsilon(:,k)*(epsilon(:,k)');
end

H=s*2/N;

end