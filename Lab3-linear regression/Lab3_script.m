%% plot the identification data
clear;
load('lab3_04.mat');
yid=id.Y;
xid=id.X;
plot(xid, yid); 

%% grid of radial basis function
grid;
N=length(xid);
fi=input(xid, N, 20);
%% system of linear equations for linear regression
 teta=fi\yid';
 yh=fi*teta;
 MSE=1/N*(sum((yid'-yh).^2));
 plot(xid, yh);
 
 %% validate
 
 xval=val.X;
 yval=val.Y;
 plot(xval, yval); hold on
 Nval=length(xval);
 
fiVal=input(xval, Nval, 20);
yValH=fiVal*teta;
plot(xval, yValH);
MSEval=1/Nval*(sum((yval'-yValH).^2));
  
 
 
 