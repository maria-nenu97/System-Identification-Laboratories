function [yhat] = yhat_fct(theta, u, na, nb)
N=length(u);
n=na+nb;
fi=zeros(N, n);

for k=1:N
    for i=1:na
        if(k-i>0)
            fi(k, i)=-yhat(k-i);
        end
    end
    for j=1:nb
        if(k-j>0)
            fi(k, j)=u(k-j);
        end
    end
    yhat=fi*theta;
end

