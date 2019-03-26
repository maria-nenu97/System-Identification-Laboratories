clear;
clc;
u0=[0.6*ones(50, 1);1.6*ones(50, 1);0.75*ones(50, 1);1.3*ones(50, 1); 2*ones(50, 1)]; %sequence of
%steps with magnitudes on the order of 0.5 ? 2 
val= system_simulator(5,u0); %generates validation dataset
plot(val);

% m-3
u=PRBS(300, 3, 0.5, 1); %identification input signal, 300 samples, m=3, values between 0.5 and 1
id=system_simulator(5, u');
figure;
plot(id);

% ARX model for m=3
na=1:15;
nb=1:15;
nk=1:5;
NN=struc(na, nb, nk);
V=arxstruc(id, val, NN);
N=selstruc(V,0);

model = arx(id, N);
compare(model, val); %comapare the obtained model with the validation dataset
title('Compare model for m=3 with val');

% order of persistent excitation for the input 
idd=detrend(u);
[c]=xcorr(idd);
figure;
plot(c);
title('Order of persistent excitation for input u');

% ARX model for m=10
u2=PRBS(300, 10, 0.5, 1); %identification input signal, 300 samples, m=10, values between 0.5 and 1
id2=system_simulator(5, u2'); %

na2=1:15;
nb2=1:15;
nk2=1:5;
NN2=struc(na2, nb2, nk2);
V2=arxstruc(id2, val, NN2);
N2=selstruc(V2,0);

model2 = arx(id2, N2);

% persistenta
idd2=detrend(u2);
[c2]=xcorr(idd2);
figure;
plot(c2);
title('Order of persistent excitation for input u2');
%compare
figure;
compare(model2, val);
title('Compare model for m=10 with val');