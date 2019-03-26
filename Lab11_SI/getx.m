function [x] = getx(C, D, u)
N=length(u);
nc=length(C)-1;
nd=length(D)-1;
theta=[C(2:end) D(2:end)]';
phi=[];

for k=1:N
    r=[];
    for i=1:nc
        if k-i<=0
            r=[r,0];
        else
            r=[r, -x(k-i)];
        end
    end
    for i=1:nd
        if k-i<=0
            r=[r,0];
        else
            r=[r, u(k-i)];
        end
    end
    %phi=[phi;r];
    x(k)=r*theta;
    
end

end
