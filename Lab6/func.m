function [theta] = func(u, y, na, nb)

N=length(y);
n=na+nb;
fi=zeros(N,n);

for i=1:N
    for j=1:na
        
        if(i-j>0)
        fi(i, j)=-y(i-j);
        end
    end
end

    for j=1:nb
        
        if(i-j>0)
        fi(i, j+na)=u(i-j);
        end
    end

theta=fi\y;

end