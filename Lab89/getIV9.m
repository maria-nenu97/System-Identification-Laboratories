function [model] = getIV9(id,na,nb,C,D)
N = length(id.U);
x = getX9(C,D,id.U);
y=[zeros(1,na) id.y'];
u=[zeros(1,nb) id.u'];
x=[zeros(1,na) x];
phi_tild=zeros(na+nb);
y_tild=zeros(na+nb,1);

for k = 1:N
    phi=[-y(k+na-1:-1:k) u(k+nb-1:-1:k)]';
    z=[-x(k+na-1:-1:k) u(k+nb-1:-1:k)]';
    phi_tild=phi_tild+(1/N)*z*phi';
    y_tild=y_tild+(1/N)*z*y(k+na);
end
teta = phi_tild\y_tild;
A=[1 teta(1:na)'];
B=[0 teta(na+1:na+nb)'];
model = idpoly(A,B,1,1,1,0,id.Ts);
end

