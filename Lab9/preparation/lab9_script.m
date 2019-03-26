load('lab9_1.mat');

%arx
na=3;
nb=4;
model_arx=arx(id, [na nb 1]);
figure;
compare(val, model_arx);

%% simple instrumental variables

C=[1];
D=[zeros(1,nb), 1];
uid=id.U;
x=getX(C,D,uid);
model_iv1=model_iv(id, na,nb, C, D);
figure;
compare(val, model_iv);

%% instrumental variables
C1=model_arx.A;
D1=model_Arx.B;
model_iv2=model_iv(id, na,nb,C1,D1);
figure;
compare(val, model_iv2);