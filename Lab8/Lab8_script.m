%%
load('lab8_4.mat');
plot(id);
u = id.u;
y = id.y;
%%
a =  0.1; %alpha-change if the model is not satisfactory
th = [1;1]; % theta=[f,b]'
f = th(1);
b = th(2);
l = 0; %l counter as required in the algorithm
delta = 0.001;%-change if the model is not satisfactory
lmax = 100; % max value of l-change if the model is not satisfactory
N = length(u);
e(1) = y(1); %first error
de(1,1) = 0; %initialize the derivative matrix 
de(2,1) = 0;
suma1 = 0; %sum for gradient
suma2 = 0; %sum for Hessian
for k=2:N
    e(k) = -f*e(k-1) + y(k) - b*u(k-1) + f*y(k-1); %prediction error formula
    de(1,k) = -e(k-1) + y(k-1); %derivative of f
    de(2,k) = -u(k-1); %derivative of b
    suma1 = suma1 +e(k)*de(:,k); %gradient sum
    suma2 = suma2 + de(:,k)*de(:,k)'; %hessian sum
end
dV = (2/N)*suma1; %function norm on matlab; compute gradient
H = (2/N)*suma2; %compute hessian
Hinv = inv(H); %invert hessian for Gauss-Newton
thnew= th - a*Hinv*dV;%Gauss-Newton update formula

while norm(thnew-th)>delta & l<lmax   %the norm function
th = thnew;  %th = theta
f = th(1);
b = th(2);
N = length(u);
e(1) = y(1);
de(1,1) = 0;
de(2,1) = 0;
suma1 = 0;
suma2 = 0;
for k=2:N
    e(k) = -f*e(k-1) + y(k) - b*u(k-1) + f*y(k-1);
    de(1,k) = -e(k-1) + y(k-1);
    de(2,k) = -u(k-1);
    suma1 = suma1 +e(k)*de(:,k);
    suma2 = suma2 + de(:,k)*de(:,k)';
end
dV = (2/N)*suma1; 
H = (2/N)*suma2;
Hinv = inv(H);
thnew= th - a*Hinv*dV;
l = l+1; %increment counter
end

%%
model = idpoly(1,[0 thnew(2)],1,1,[1 thnew(1)],0,id.Ts);
compare(model,val);

%% OE
model2=oe(id, [15, 15, 1]);
figure;
compare(model2, val);
title('Compare oe with validation');