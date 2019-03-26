load('lab6_4');
uid=id.U;
yid=id.Y;
%plot(id);

na=2;
nb=2;
nk=1;
theta=func(uid, yid, na, nb);

%% validation
uval=val.U;
yval=val.Y;
yhatv=yhat(theta, uval, na, nb);
figure;
plot(yval); hold on;
plot(yhatv);

e=yval-yhatv;
MSE=1/length(yhatv)*sum(e.^2);
 
%% ARX
model=arx(id, [na, nb, nk]);
figure;
compare(model, val);
Na=1:15;
Nb=1:15;
Nk=1:5;
NN=struc(Na, Nb, Nk);
v=arxstruc(id, val, NN);
N=selstruc(v, '0');
model=arx(val, N);
figure;
compare(model, val);

theta1 = func(uid, yid, N(1), N(2));
yhatval = yhat(theta1,yval, N(1),N(2));

figure;
plot(yval);hold on;
plot(yhatval);