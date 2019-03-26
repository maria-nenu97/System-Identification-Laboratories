%% Second order, transient analysis of impulse response
clear;
load('lab4_order2_5.mat');
y=data.Y;
u=data.U;
plot(data);

%% identification

yid=y(1:130);
uid=u(1:130);
tid=t(1:130); 

uss=0.5;
yss=mean(yid(1:30));
ymax=6.49;
k=yss/uss;


t00=0.96; %%before the peak
k0=31;

t01=1.74  %%after the peak
k1=56

t02=2.69  %%after the valley
k2=85

t1=1.25
t2=2.05

T0=2*(t2-t1);
ts=t(2)-t(1);

Ap=ts*sum(yid(k0:k1));
Am=ts*sum(yid(k1:k2));

M=Am/Ap; %ovsht

xi=(log(1/M))/(((pi^2)+(log(M))^2))^(1/2);
wm=(2*pi)/(T0*(1-xi^2)^(1/2));


%% state space
A=[0 1; -wm^2 -2*xi*wm];
B=[0; k*wm^2];
C=[1 0];
D=0;

Hss=ss(A,B,C,D);
ysim=lsim(Hss, data.u, t, [yss, 0]);
plot(t(130:330), ysim(130:330), t(130:330), data.y(130:330)); 
grid;
figure;
plot(t, ysim);
hold on;
plot(t, data.y); 




