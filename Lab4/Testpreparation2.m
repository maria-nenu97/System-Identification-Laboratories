clear;
load('lab4_order2_5.mat');
y=data.Y;
u=data.U;
yid=y(1:130);
uid=u(1:130);
tid=t(1:130);
plot(data);

uss=0.5;
yss=mean(yid(1:30));
k=yss/uss;

t00=0.977;
k0=31;
t01=1.74;
k1=55;
t02=2.46;
k2=78;

t1=1.25;
t2=2.05;

T0=2*(t2-t1);
Ts=t(2)-t(1);

Am=Ts*sum(yid(k1:k2));
Ap=Ts*sum(yid(k0:k1));
M=Am/Ap;

xi=(log(1/M))/(((pi^2)+(log(M))^2))^(1/2);
wn=2*pi/(T0*sqrt(1-xi^2));

A=[0, 1; -wn^2, -2*xi*wn];
B=[0; k*wn^2];
C=[1, 0];
D=0;
Hss=ss(A,B,C,D);

yval=y(130:end);
uval=u(130:end);
tval=t(130:end);
ysim=lsim(Hss, uval, tval,[yss, 0]);
figure;
plot( tval, ysim); hold on;
plot(tval, yval)