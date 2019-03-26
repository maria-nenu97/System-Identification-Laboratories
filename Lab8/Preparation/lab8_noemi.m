clear;
load('lab8_4.mat');
%plot(id);
u = id.u;
y = id.y;

sig = 0.0001;
a=0.1;
lmax=  100;

l = 0;

th = [1;1];
f = th(1);
b= th(2);
e(1) = y(1);
de(1,1) = 0;
de(2,1) = 0;
N = length(u);
sum = [0 0];
sum2= [0 0; 0 0];
for k=2:N
    e(k) = -f*e(k-1)+y(k)-b*u(k-1)+f*y(k-1);
    de(1,k) = -e(k-1)+y(k-1);
    de(2,k) = -u(k-1);
    sum = sum + e(k)*de(:,k);
    sum2 = sum2 + de(:,k)*de(:,k)';
end
dV = 2/N*sum;
H = 2/N*sum2;

Hinv = inv(H);
thn = th-a*Hinv*dV;
l = l+1;
while sqrt((thn(1)-th(1))^2+(thn(2)-th(2))^2)>sig & l<lmax
    th = thn;
    f = th(1);
    b= th(2);
    e(1) = y(1);
    de(1,1) = 0;
    de(2,1) = 0;
    sum = [0 0];
    sum2= [0 0; 0 0];
    for k=2:N
        e(k) = -f*e(k-1)+y(k)-b*u(k-1)+f*y(k-1);
        de(1,k) = -e(k-1)+y(k-1);
        de(2,k) = -u(k-1);
        sum = sum + e(k)*de(:,k);
        sum2 = sum2 +de(:,k)*de(:,k)';
    end
    dV = 2/N*sum;
    H = 2/N*sum2;

    Hinv = inv(H);
    thn = th-a*Hinv*dV;
    l = l+1;
end

%%
model = idpoly(1,[0 thn(2)],1,1,[1 thn(1)],0,id.Ts);
compare(model,val)
