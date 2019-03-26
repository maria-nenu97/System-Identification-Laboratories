load('lab9_3.mat');
%% ARX
na=3;
nb=3;
arx_model=arx(id,[na nb 1]);
figure
compare(arx_model,val);
%%
C=[1];
D=[zeros(1,nb),1];
uid=id.U;
x=getx(C,D,uid);
model_IV=getIV(id,2,2,C,D);
figure
compare(model_IV,val);
%%
C=arx_model.A;
D=arx_model.B;
model_IV2=getIV(id,2,2,C,D);
figure
compare(model_IV2,val);
%%
model_IV3=iv(id,[na nb 1],C,D);
figure
compare(model_IV3,val);