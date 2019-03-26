function [ryu] = fryu(N, id)
for tau=0:N
    sum=0;
    for k=1:N-tau
        sum=sum+id.y(k+tau)*id.u(k);
    end
    ryu(tau)=sum*(1/(N-tau));
end
end

