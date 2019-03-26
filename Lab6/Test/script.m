clear;
clc;
load('lab6_4.mat');

%% identification 

uid=id.U;
yid=id.Y;
plot(id); 

na=2;
nb=2;
nk=1;
theta=theta_fct(uid, yid, na, nb);

%% validation
uval=val.U;
yval=val.Y;
plot(val);

yhat=yhat_fct(theta, uval, na, nb);
figure;
plot(yval); hold on;
plot(yhat);
%MSE

%% ARX

model=arx(id, [na, nb, nk]); %identify the model, delay 1
figure;
compare(model, val);

Na=1:15;
Nb=1:15;
Nk=1:5;
NN=struc(Na, Nb, Nk); %generates all combinations of orders in Na, Nb, Nk
V=arxstruc(id, val, NN); % identifies for each combination an ARX model
N=selstruc(V, '0'); %smalles MSE
modelv=arx(id, N);
compare(modelv, val);

