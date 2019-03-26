function [theta, thetaM] = fct(id, na, nb, thetaZ, PinvZ)
y=id.Y;
u=id.U;
N=length(y);
theta=thetaZ;
Pinv=PinvZ;

thetaM=[];

for k=1:N
    fi=zeros(1, na+nb)';
    for j=1:na
        if(k-j>0)
            fi(j)=-y(k-j);
        end
    end
    for j=1:nb
        if(k-j>0)
            fi(j+na)=u(k-j);
        end
    end
    
    epsilon=y(k)-fi'.*theta;
Pinv=Pinv-(Pinv*fi*fi'*Pinv)/(1+fi'*Pinv*fi);
    theta=theta+Pinv.*fi.*epsilon;
    thetaM=[thetaM; theta'];
end