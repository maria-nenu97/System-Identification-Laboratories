function [theta] = theta_fct(u, y, na, nb)
N=length(u);
n=na+nb;
fi=zeros(N, n);

for k=1:N
    for i=1:na
        if(k-i>0)
            fi(k, i)=-y(k-i);
        end
    end
    for i=1:nb
          if(k-i>0)
            fi(k, i)=u(k-i);
        end
    end  
    theta=fi\y;
end

