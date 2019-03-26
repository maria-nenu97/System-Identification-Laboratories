load('lab3_04.mat');
yid=id.Y;
xid=id.X;

plot(xid, yid);

% radial basis
n=20;
grid;
N=length(xid);
fi=func(xid, N, n);

theta=fi\yid';
yh=fi*theta;
Mse=1/N*(sum(yid'-yh).^2)

%val
xval=val.X;
yval=val.Y;
Nv=length(xval);
fiv=func(xval, Nv, n);

yhv=fiv*theta;
Mse=1/Nv*(sum(yval'-yhv).^2)

plot(xval, yval); hold on;
plot(xval, yhv);