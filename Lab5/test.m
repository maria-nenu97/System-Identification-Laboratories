%% correlation analysis
clear;
load('lab5_8.mat');
plot(id);
figure;
plot(val)

%remove the means;
iddr=detrend(id);
%% check zero means is white noise
[c]=xcorr(iddr.u);
figure;
plot(c)
 %% 
M=45;
plotlevel=1;
fir=cra(iddr, M, 0, plotlevel)

%% identification data
yhat=conv(fir, id.u);
yhat=yhat(1:length(id.u));
figure;
plot(yhat)

%validation
yhatv=conv(fir, val.u);
yhatv=yhatv(1:length(val.u));
figure;
plot(yhatv); hold on;
plot(val.y)

figure;
model=impulseest(iddr, M)
compare(model, val)