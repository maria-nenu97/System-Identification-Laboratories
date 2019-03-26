function [u] = PRBS(N, m, a, b)
Pmax = 2^m - 1; % max length PRBS
x = ones(m,1);
A = [];

switch(m) %The following coefficients must be 1 to achieve maximum length
    case 3
       av=[1 0 1];
    case 4
        av=[1 0 0 1];
    case 5
        av=[0 1 0 0 1];
    case 6
        av=[1 0 0 0 0 1];
    case 7
        av=[1 0 0 0 0 0 1];
    case 8
        av=[1 1 0 0 0 0 1 1];
    case 9
        av=[0 0 0 1 0 0 0 0 1];
    case 10
        av=[0 0 1 0 0 0 0 0 0 1];
    otherwise
        return
        
end
A=[av; eye(m-1) zeros(m-1, 1)]; %A matrix, av vector line, eye, zeros column

%construct input signal u 
for k=1:max(N,Pmax)
    xnew = mod(A*x,2);
    u(k) = x(m);
    x = xnew;
    
end
u = a + (b-a)*u; % final input signal, with a - b switching values
end

