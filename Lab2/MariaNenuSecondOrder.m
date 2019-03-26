%% transfer function model

load('lab2_order2_7.mat');
% plot the input and the output of the data
y=data.y
u=data.u
plot(data)

%% identification, plot the first 100 values for identification
yid=y(1:100);
uid=u(1:100);
tid=t(1:100);
plot(tid, yid); hold on
%%
yss=mean(yid(90:100));
uss=mean(uid(90:100));
%Tind=find(yid>=0.632*yss, 1, 'first')
y0=0;
u0=0;
k=(yss-y0)/(uss-u0);
%% 
yt1=3.537
t1=3.267
yt2=2.136
t2=6.767
yt3=2.795
t3=9.8
M=(yss-yt2)/(yt1-yss)
xi=log(1/M)/((pi^2+(log(M)^2)^(1/2)))
t0=t3-t1


w=(2*pi)/(t0*(1-(xi^2))^(1/2));
H=tf(k*(w^2),[1, 2*xi*w, w^2])
%% validation

yval=y(201:500)
uval=u(201:500)
tval=t(201:500)

%plot(tval, yval); 
hold;
ysim=lsim(H, uval, tval);
plot(ysim); hold on;
plot(yval)
MSE=1/300*(sum(ysim-yval)^2)



