clear; 
clc;
% #6
load('lab10_8.mat');
na=3*n;
nb=3*n;
thetaZ=zeros(na+nb, 1);
s=1e-3;
PinvZ=(1/s)*eye(na+nb);

[theta, thetaM]=fct(id, na, nb, thetaZ, PinvZ);

N=length(id.Y);
theta=thetaM(N,:);

A=[1 theta(1:na)];
B=[0 theta(na+1:na+nb)];

Ts=id.Ts;
model=idpoly(A, B, [], [], [], 0, Ts);
compare(val, model);
figure;
%% 10% of the data

theta2=thetaM(round(length(id.U)/10),:);

A2=[1 theta2(1:na)];
B2=[0 theta2(na+1:na+nb)];

model2=idpoly(A2, B2, [], [], [], 0, Ts);
compare(val, model2);
figure;

%% s=100

s=1e-3;
PinvZ=(1/s)*eye(na+nb);
[theta, thetaM]=fct(id, na, nb, thetaZ, PinvZ);
N=length(id.Y);
theta3=thetaM(N,:);

A3=[1 theta3(1:na)];
B3=[0 theta3(na+1:na+nb)];

model3=idpoly(A3, B3, [], [], [], 0, Ts);
compare(val, model3);
figure;
%% rarx 100%
thetaR=rarx(id, [na, nb, 1], 'ff', 1, thetaZ, PinvZ);
thetaR=thetaR(N, :)

Ar=[1 thetaR(1:na)];
Br=[0 thetaR(na+1:na+nb)];

modelR=idpoly(Ar, Br, [], [], [], 0, Ts);
compare(val, modelR);

%% rarx 10%
thetaR=rarx(id, [na, nb, 1], 'ff', 1, thetaZ, PinvZ);
thetaR=thetaR(round(length(id.U)/10), :);

Ar=[1 thetaR(1:na)];
Br=[0 thetaR(na+1:na+nb)];

modelR=idpoly(Ar, Br, [], [], [], 0, Ts);
compare(val, modelR);