function [teta] = findteta(u,y,na,nb)
phi=[];
N= length(u);
for k=1:1:N
    v = [];
    for i = 1:1:na
        if ((k-i)<=0)
            v= [v,0];
        else
            v = [v, -y(k-i)];
        end
    end
    for j = 1:1:nb
        if ((k-j<=0))
            v = [v,0];
        else
            v = [v, u(k-j)];
        end
    end
    phi = [phi;v];
end
teta = phi \ y;
end

