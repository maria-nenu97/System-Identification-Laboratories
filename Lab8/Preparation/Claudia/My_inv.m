function [ theta ] = My_inv( id,na,nb,theta_init )
    y=id.Y;
    u=id.U;
    S1=zeros(na+nb);
    S2=zeros(na+nb,1);
    y_=[zeros(na+nb,1);y]';
    u_=[zeros(na+nb,1);u]';
    YE=zeros(1,na+nb);
    for i=1+na+nb:length(y_)
        ye=[-YE(i-1:-1:i-na),u_(i-1:-1:i-nb)]*theta_init;
        YE(i)=ye;
        L=[-y_(i-1:-1:i-na),u_(i-1:-1:i-nb)];
        Z=[-YE(i-1:-1:i-na),u_(i-1:-1:i-nb)];
        S1=S1+Z'*L; S2=S2+Z'*y_(i);
    end
theta=inv(S1)*S2;

