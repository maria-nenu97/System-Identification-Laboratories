function [x] = getX9(C,D,u)
N = length(u);
nc = length(C) - 1;
nd = length(D) - 1;
teta=[C(2:end) D(2:end)]';
phi=[];

for k = 1 : N
    r = [];
    for i = 1 : nc
        if (k-i) <= 0 
            r = [r,0];
        else
            r = [r, -x(k-i)];
        end
    end
    
    for j = 1 : nd
        if (k-j) <= 0
            r = [r,0];
        else
            r = [r, u(k-j)];
        end
    end
        x(k) = r* teta;  
end
end

