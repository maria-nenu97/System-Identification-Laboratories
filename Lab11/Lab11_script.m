%% index no 5
%% closed loop
load("lab11cl_5.mat");
u=id.U;
y=id.Y;
n=2;
plot(id);
plot(val);

na=n;
nb=n;

arxmodel=arx(id, [na, nb, 1]);
model=getIV(id, na, nb, rid);
figure;
compare(model, val);
figure;
compare(val, model, arxmodel);

arxmodel=arx(id, [na, nb, 1]);
C=arxmodel.A;
D=arxmodel.B;
model2=iv(id, [na nb 1], C, D);
figure;
compare(model2, val);


%% part2 open loop
load("lab11mv_5.mat");


na=n;
nb=n;
nf=n;
mARX=arx(id, [na, nb, 1]);
resid(mARX, id);
title('mARX');
figure;
compare(mARX, val);

mOE=oe(id, [na, nf, 1]);
resid(mOE, id);
title('mOE');
figure;
compare(mOE, val);