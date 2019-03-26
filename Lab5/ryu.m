function [ryu] = fryu(N)
for tau=0:N
    sum=0;
    for k=1:N-tau
        sum=sum+Yid.y(k+tau)*Yid.u(k)
    end
    ryu(tau)=sum/(N-tau)
end
end

