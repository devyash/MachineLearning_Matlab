function [W2,W3] = train(W2,W3,X,Y,m,K,eta)
for k=1:K
    delta3=zeros(1,5);
    delta2=zeros(3,4);
for i=1:m
    a1=[1,X(i,:)];
    Z2=a1*W2;
    a2withoutbias=(1+exp(-Z2)).^-1;
    a2=[1,a2withoutbias];
    Z3=W3*a2';
    a3=(1+exp(-Z3)).^-1;
    
    del3=a3-Y(i,1);
    del2=W3.*del3.*(a2.*(1-a2));
    
    delta3 = delta3 + a2*del3;
    delta2 = delta2 + a1'*del2(:,2:5);
end
W2=W2-eta*delta2/m;
W3=W3-eta*delta3/m;
end
end

