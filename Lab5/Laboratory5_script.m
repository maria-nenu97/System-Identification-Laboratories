%% correlation analysis
clear;
load('lab5_8.mat');

%plot
plot(id);
figure;
plot(tid);

%%remove the means
Yid=detrend(id);
plot(Yid);

[c]=xcorr(Yid.u);
figure,
plot(c); %Check whether the zero-mean input is white noise
%%
M=45;
plotlevel=1;
fir=cra(Yid, M, 0, plotlevel); %Identify an FIR model

N=length(Yid.u);
ru=sum(id.u.^2)
%ryu=fryu(N, Yid);

yhat=conv(fir, Yid.u);
yhat=yhat(1:length(Yid.u));
figure,
plot(Yid.y); hold on
plot(yhat, 'red');

%% validation
yhatv=conv(fir, val.u);
yhatv=yhatv(1:length(val.u));
figure,
plot(val.y); hold on
plot(yhatv, 'red')

%% 
model=impulseest(Yid, M);
compare(model, val);






