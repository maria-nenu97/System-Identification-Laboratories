function [yhat] = yhat(theta, u, na,nb)
yhat=[];
for k=1:1:length(u)
    v = [];
    for i = 1:1:na
        if ((k-i)<=0)
            v= [v,0];
        else
            v =[v, -yhat(k-i)];
        end
    end
    for j = 1:1:nb
        if ((k-j<=0))
            v =[v,0];
        else
            v =[v, u(k-j)];
        end
    end
yhi = v * teta;
yhat = [yhat;yhi];
end
end


