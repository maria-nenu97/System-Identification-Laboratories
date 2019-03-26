%% transient analysis of the second order

load('lab2_order2_7.mat');
y=data.Y;
u=data.U;
plot(data);

%% identification data

yid=y(1:100);
uid=u(1:100);
tid=t(1:100);
plot(tid, yid);
u0=0;
y0=0;
yss=mean(yid(90:100));
uss=3; %from the graph

yt1=3.537;
t1=3.267;
yt2=2.136;
t2=6.767;
t3=9.8;
yt3=2.795;

k=yss/uss; %gain
M=(yss-yt2)/(yt1-yss);
xi=log(1/M)/((pi^2+(log(M)^2)^(1/2)));
T0=t3-t1; %period
wn=(2*pi)/(T0*sqrt(1-xi^2)); %natrual frequency

H=tf(wn^2, [1, xi*wn*2, wn^2]); %transfer function model

%% validation
yval=y(201:500);
uval=u(201:500);
tval=t(201:500);

ysim=lsim(H, uval, tval);
plot(ysim);
hold on;
plot(yval);