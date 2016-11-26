%clear the previous data
clear;clc;

%X is the training input Y is the training output matrix
X=[ 1,0;0,1;-1,0;0,-1;0.5,0.5;-0.5,0.5;0.5,-0.5;-0.5,-0.5];
Y=[1;1;1;1;0;0;0;0];

%random weights initialized
W2= randn(3,4);
W3= randn(1,5);

%Number of training samples
m=8;

%Train on input the last two parameters are Number of iterations and eta
[W2,W3] = train(W2,W3,X,Y,m,10000,0.5);

%Plotting the decision boundary
decisionBoundary(W2,W3,-1,1,0.1,-1,1,0.1);

%Scatter plot for random samples in multiples of 8 also used for testing fr
%input data, if it is trained efficiently
for i = 1:100
testmatrix=randn(8,2);
[OUTPUT] = test(testmatrix,m,W2,W3);
end
[OUTPUT] = test(X,m,W2,W3);


