function [W2,W3] = train(W2,W3,X,Y,m,K,eta)
%for loop for iterations
for k=1:K
    delta3=zeros(1,5);
    delta2=zeros(3,4);
%for loop for number of samples of training set 
for i=1:m
    %activation matrix of input layer with bias
    a1=[1,X(i,:)];
    %Output after the weight matrix and activation function are multiplied
    Z2=a1*W2;
    %Signmoid perceptron
    a2withoutbias=(1+exp(-Z2)).^-1;
     %activation matrix of hidden layer with bias
    a2=[1,a2withoutbias];
    
    %Output after the weight matrix and activation function are multiplied
    Z3=W3*a2';
    
     %activation matrix of output layer with bias
    a3=(1+exp(-Z3)).^-1;
    
    %calculation of partial derivative
    del3=a3-Y(i,1);
    del2=W3.*del3.*(a2.*(1-a2));
    %total cost
    delta3 = delta3 + a2*del3;
    delta2 = delta2 + a1'*del2(:,2:5);
end
%updating the weights
W2=W2-eta*delta2/m;
W3=W3-eta*delta3/m;
end
end

