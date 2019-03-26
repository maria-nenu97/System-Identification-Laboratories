function [E,epsilon] = epsilon(teta,u,y)
f=teta(1,1);
b=teta(2,1);
epsilon(1,:)=[0;0];
E(1)=y(1);
for k=2:length(u)
    E(k)=-f*epsilon(k-1)+y(k)-b*u(k-1)+f*y(k-1);
    epsilon(1,k)=-epsilon(k-1)+y(k-1);
    epsilon(2,k)=-u(k-1);
end

end