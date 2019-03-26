%% identification
clear;
load('lab8_1.mat');
plot(id.y);
%%
% inicializalok mindent
yid = id.y;
uid = id.u;
l = 0; %counter value initialized
delta = 0.001;
lmax = 100;
sum =[0;0];
sum2 = [0 0;0 0];
alfa = 0.001;
N = length(uid);
f = 1;
b = 1;
Qold = [f;b]; %theta
e(1) = yid(1); % hard coding e(1) based on e(0) = 0 and u(0) = y(0) = 0
dEf(1) =0;
dEb(1) = 0;
% computing e(k)
for k = 2:length(uid)
    e(k) = -f*e(k-1) + yid(k) - b*uid(k-1) + f*yid(k-1);
    dEf(k) = -e(k-1) + yid(k-1);
    dEb(k) = -uid(k-1);
end
% dE(k)/dQ
for k = 1:length(uid)
      dEQ(:,k) = [dEf(k) ; dEb(k)];
end
% dV/dQ
for k =  1:N
   sum = sum + e(k)* dEQ(:,k);
end
dVQ = 2/N*sum;
% Hessian
for k = 1:N
    sum2 = sum2 + dEQ(:,k) * (dEQ(:,k))';
end
H = 2/N*sum2;
% new theta
Qnew = Qold - alfa* inv(H)*dVQ;
% iterating until best theta is found

while (norm(Qnew - Qold)>= delta) & (l <lmax)  % ha helytelen igy, hasnalj norm-ot abs helyett
    l = l+1;
    Qold = Qnew;
    f = Qold(1);
    b = Qold(2);
    e(1) = yid(1);
    dEf(1) =0;
    dEb(1) = 0;
    % E(k)
    for k = 2:length(uid)
        e(k) = -f*e(k-1) + yid(k) - b*uid(k-1) + f*yid(k-1);
        dEf(k) = -e(k-1) + yid(k-1);
        dEb(k) = -uid(k-1);
    end
    % dE(k)/dQ
    for k = 1:length(uid)
          dEQ(:,k) = [dEf(k) ; dEb(k)];
    end
    % dV/dQ
    sum =[0;0];
    N = length(uid);
    for k =  1:N
       sum = sum + e(k)* dEQ(:,k);
    end
    dVQ = 2/N*sum;
    % H
    sum2 = [0 0;0 0];
    for k = 1:N
        sum2 = sum2 + dEQ(:,k) * (dEQ(:,k))';
    end
    H = 2/N*sum2;
    % new theta
    Qnew = Qold - alfa* inv(H)*dVQ;
end
ts = 0.0574647; % sampling time of identification data
fn = Qnew(1);
bn = Qnew(2);
model = idpoly(1,[0 bn],1,1,[1 fn], 0, id.Ts);

compare(model,val);