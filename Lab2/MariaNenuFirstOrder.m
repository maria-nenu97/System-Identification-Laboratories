%% transfer function model
load('lab2_order1_7.mat')
%plot the input and output
y=data.y
u=data.u
plot(data)

%% plot the first 100 values for identification
yid=y(1:100)
uid=u(1:100)
tid=t(1:100)
plot(tid, yid);
yss=0.1; % yss from graph
uss=1; % uss from graph
%%
Tind=find(yid>=0.632*yss, 1, 'first') % got the indice of T
y0=0;
u0=0;
k=(yss-y0)/(uss-u0); % K formula
T = tid(Tind) %obtain T from the tid vector at Tind indice

%% validation data
yval=y(201:500)
uval=u(201:500)
tval=t(201:500)
plot(tval, yval)
hold;

H=tf(k, [T, 1]); % transfer function for the first order
ysim=lsim(H, uval, tval)
plot(tval, ysim) % plot the last 300 values of simulated y, along with data y

MSE=1/300*(sum(ysim-yval)^2) % mean square error
