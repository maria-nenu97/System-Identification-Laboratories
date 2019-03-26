load('lab9_7.mat');
%% model arx
na = 3;
nb = 4;
model_arx = arx(id,[na,nb,1]);
figure;
compare(val,model_arx);
%% IV cu variabile instrumentale simple
C = [1];
D = [zeros(1,nb),1];
uid = id.U;
x = getX9(C,D,uid);
model_IV=getIV9(id,na,nb,C,D);
figure;
compare(val,model_IV);
%% IV cu variabile instrumentale 
C1 = model_arx.A;
D1 = model_arx.B;
model_IV2=getIV9(id,na,nb,C1,D1);
figure;
compare(val,model_IV2);
%% 
model_IV3=iv(id,[na nb 1],C,D);
figure
compare(model_IV3,val);
%%
model_IV4=iv(id,[na nb 1],C1,D1);
figure
compare(model_IV4,val);


