load('lab3_04.mat');
x=id.X;
y=id.Y;
plot(x, y);
n=20;
% grid basis function

grid;
N=length(x);
fi=gfct(x, N, n);
theta=fi\y';
yh=fi*theta;

MSE=1/N*(sum((y'-yh).^2));


xv=val.X;
yv=val.Y;
Nv=length(xv);
fiv=gfct(xv, Nv, n);
yhv=fiv*theta;
plot(xv, yv); hold on;
plot(xv, yhv);
legend('yh', 'yhv');