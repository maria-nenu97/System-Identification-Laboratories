function [model] = getIV(id,na,nb, rid)

N=length(id.u);
rid=[zeros(1,na+nb) rid'];
u=[zeros(1,nb) id.U'];
y=[zeros(1,na) id.Y'];
phitild=zeros(na+nb);
ytild=zeros(na+nb, 1);

for k=1:N
    z=[rid((k+na+nb-1):-1:k)]';
    phi=[-y((k+na-1):-1:k) u((k+nb-1):-1:k)]';
    phitild=phitild+1/N*(z*phi');
    ytild=ytild+1/N*(z*id.y(k));
end
teta=phitild\ytild;
A=[1 teta(1:na)'];
B=[0 teta(na+1:na+nb)'];
model=idpoly(A, B, 1, 1, 1, 0, id.Ts);
end

