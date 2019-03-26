clear;
load('lab9_1.mat');

model_arx = arx(id,[2 2 1]);
compare(val, model_arx);
title('Arx model vs Val');
figure;

%% getX 
%data
u = id.u;
na = n;
nb = n;
C = model_arx.A;
D = model_arx.B;


% function
N = length(u);
nc = length(C)-1; %first value is not used =>theta begins from 2
nd = length(D)-1;
theta = [C(2:end),D(2:end)]; %line=> going to be transposed
for k = 1:N
    for j=1:nc
        
        if k-j>0
            fi(k,j)=-x(k-j);
        else
            fi(k,j)=0;
        end
    end
    for i=1:nd
        if k-j>0
            fi(k,nc+i)=u(k-i);
        else
            fi(k,i+nc)=0;
        end
    end
    x(k) = fi(k,:)*theta';
end

%% getIV 
%data
y = [zeros(1,na) id.y']; %when index of y<=0 
u = [zeros(1,nb) id.u'];
x = [zeros(1,na) x];
phi_tilda = 0;
y_tilda = 0;

%function
for k = 1:N
   phi=[-y(k+na-1:-1:k) u(k+nb-1:-1:k)]';
    z=[-x(k+na-1:-1:k) u(k+nb-1:-1:k)]';
    phi_tilda=phi_tilda+(1/N)*z*phi';
    y_tilda=y_tilda+(1/N)*z*y(k+na);
end
teta = phi_tilda\y_tilda;
A=[1 teta(1:na)'];
B=[0 teta(na+1:na+nb)'];


model = idpoly(A,B,1,1,1,0,id.Ts);
compare(val,model);
title('Idpoly model vs Val');
figure;


%% IV model
ivmodel1 = iv(id,[na nb 1],C,D);
compare(val,ivmodel1);figure
title('IV with instruments vs Val');


ivmodel2 = iv4(id,[na nb 1]);
compare(val,ivmodel2);
title('IV with simple instruments vs Val');