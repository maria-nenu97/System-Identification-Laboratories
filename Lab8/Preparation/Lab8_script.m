clear;
clc;
load('lab8_4.mat');

yid=id.Y;
uid=id.U;
plot(id);
uval=val.U;
yval=val.Y;

theta=[.20;1];

lmax=length(yid);

alpha=0.1;

for l=0:2e3
    [E,e]=epsilon(theta,uid,yid);
    V=gradient(E,e,length(yid));
    H=hessian(e,length(yid));
    thetanew=theta-alpha*inv(H)*V;
    theta=thetanew;
end

A=1;
C=1;
D=1;
B=[0,theta(2,1)];
F=[1,theta(1,1)];

model=idpoly(A,B,C,D,F,0,id.Ts);

figure;
compare(model,val);
