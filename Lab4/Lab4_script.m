%% laboratory 4, transient analysis of impulse response
clear;
load('lab4_order1_5.mat');
y=data.Y;
plot(data);

%% identification
y=data.Y;
u=data.U;

yid=y(1:130);
uid=u(1:130);
tid=t(1:130); 
yval=y(131:end);
uval=u(131:end);
tval=t(131:end);

uss=0.5;
yss=mean(yid(1:30));
ymax=0.242;

k=yss/uss;
T=k/ymax;

plot(tid, yid); hold;
H=tf(k, [T, 1]);

A=(-1)/T;
B=k/T;
C=1;
D=0;

Hss=ss(A, B, C, D);

ysim=lsim(Hss, uid, tid, yss); 
plot(tid, ysim)
%% validation 

ysim=lsim(Hss, uval, tval, yss); 
plot(tval, ysim); hold;
plot(tval, yval)
MSE=(sum(ysim-yval)^2)/200