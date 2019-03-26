clear;
clc;
load('lab8_7.mat');
uid = id.U;
yid = id.Y;

l = 0;
lmax = 100;
a=0.1;
teta = [1 1;1 1];
sigma = 0.001; 

[eps,der, sum1, sum2]=eroare(teta, uid, yid);
dV = 2/length(uid) * sum1;
H = 2/length(uid) * sum2;
teta2 = teta-a*inv(H)*dV;

while norm(teta2-teta)>sigma && l<lmax
    teta = teta2;
    [eps, der, sum1, sum2]=eroare(teta, uid, yid);
    dV = (2/length(uid)) * sum1;
    H = (2/length(uid)) * sum2;
    teta2=teta - a*inv(H) * dV;
    l=l+1;
end

model = idpoly(1,[0 teta2(2)],1,1,[1 teta2(1)],0,id.Ts);
compare(model,val);







