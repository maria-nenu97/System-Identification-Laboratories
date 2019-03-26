clear all
close all
clc

load('lab9_4');
u=id.U;
y=id.Y;
s_arx=arx(id,[n,n,1]);
%compare(s_arx,val); 

A=s_arx.A;
B=s_arx.B;
theta_init=[A(2:end)';B(2:end)'];
theta=My_inv(id,n,n,theta_init);

A_1=[1 theta(1:n)'];
B_1=[0 theta(n+1:end)'];

h=tf(B_1,A_1,id.Ts,'variable', 'z^-1');
yc=lsim(h,val.U);
plot(yc); hold on; plot(val.Y);legend('yc','val.Y');
sys=idpoly(A_1,B_1,1,1,1,0,id.Ts);
compare(sys,val);

e=val.Y-yc;
mse=1/length(e)*sum(e.^2);
title(['MSE=',num2str(mse)]);

s_iv=iv4(id,[n,n,1]);
compare(s_iv,val);

%% nu mere
% C=zeros(n,1);
% D=zeros(n,1);
% C(n)=1;
% D(1)=1;
% s2_iv=iv(id,[n,n,1],C,D);
% compare(s2_iv,val);