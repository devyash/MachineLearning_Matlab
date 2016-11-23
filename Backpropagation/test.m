function [OUTPUT] = test( X,m,W2,W3 )
OUTPUT=zeros(m,1);
for i=1:m
    a1=[1,X(i,:)];
    Z2=a1*W2;
    a2withoutbias=(1+exp(-Z2)).^-1;
    a2=[1,a2withoutbias];
    Z3=W3*a2';
    a3=(1+exp(-Z3)).^-1;
    figure(1)
    if(a3>=0.5)
        OUTPUT(i,1)=1;
        scatter(X(i,1),X(i,2),'filled','red');
        hold on;
    else
        OUTPUT(i,1)=0;
        scatter(X(i,1),X(i,2),'green');
        hold on;
    end
     
end
end

