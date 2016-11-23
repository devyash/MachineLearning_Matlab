function [W2,W3] = train(W2,W3,X,Y,m,K)
for k=1:K
for i=1:m
    a1=[1,X(i,:)];
    Z2=a1*W2;
    a2withoutbias=(1+exp(-Z2)).^-1;
    a2=[1,a2withoutbias];
    Z3=W3*a2';
    a3=(1+exp(-Z3)).^-1;
    del3=a3-Y(i,1);
    del2=W3'.*del3.*(a3*(1-a3));
    delta(i,:)=0;
    delta(i,:)=delta(i,:)+a3*del3+a2*del2;
end
meandelta=sum(delta)/8;
W2=W2-meandelta;
W3=W3-meandelta;
end
end

