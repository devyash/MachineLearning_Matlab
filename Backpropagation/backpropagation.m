clear;clc;
X=[ 1,0;0,1;-1,0;-1,0;0.5,0.5;-0.5,0.5;0.5,-0.5;-0.5,-0.5];
Y=[1;1;1;1;0;0;0;0];
W2= randi([-1,1],3,4);
W3= randi([-1,1],1,5);
m=8;
[W2,W3] = train(W2,W3,X,Y,m,10000);
OUTPUT=zeros(m,1);
for i=1:m
    a1=[1,X(i,:)];
    Z2=a1*W2;
    a2withoutbias=(1+exp(-Z2)).^-1;
    a2=[1,a2withoutbias];
    Z3=W3*a2';
    a3=(1+exp(-Z3)).^-1;
    if(a3>=0.5)
        OUTPUT(i,1)=1;
    else
        OUTPUT(i,1)=0;
    end
     
end

