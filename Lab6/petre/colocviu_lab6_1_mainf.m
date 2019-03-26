clc;
close all;
load('lab6_4.mat');
%% IDENTIFICATION
uid = id.U;
yid = id.Y;
na = 9;
nb = 9;
teta = findteta(uid,yid,na,nb);

%% VALIDATION
uval = val.U;
yval = val.Y;

yhat1 = yhat(teta,uval,na,nb);

figure;
plot(yval);hold on;
plot(yhat1);

e = yval - yhat1;
MSE = 1/length(yhat1) * sum(e.^2);

%% ARX FUNCTIONS
model = arx(id , [na nb 1]); %identifying the model, delay = 1;
figure;
compare(model,val);

Na = 1:15;
Nb = 1:15;
Nk = 1:5;
NN = struc(Na, Nb, Nk); %generates all combinations of orders
V = arxstruc(id, val, NN); %returns on the first row of the vector the MSE of the generated ARX models
N = selstruc(V,'0'); %selects the struct with the best MSE
model = arx(val , N);
figure;
compare(model, val);

theta1 = findteta(uid, yid, N(1), N(2));
yhatval = yhat(theta1,yval, N(1),N(2));

figure;
plot(yval);hold on;
plot(yhatval);









