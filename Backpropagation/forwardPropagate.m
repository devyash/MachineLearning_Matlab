function [a3] = forwardPropagate( X,W2,W3 )
%function for forward propagation of neural network
    a1=[1,X(1,:)];
    Z2=a1*W2;
    a2withoutbias=(1+exp(-Z2)).^-1;
    a2=[1,a2withoutbias];
    Z3=W3*a2';
    a3=(1+exp(-Z3)).^-1;

end
