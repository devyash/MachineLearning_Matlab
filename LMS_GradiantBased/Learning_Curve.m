clear;
load ('training.mat');
load('validate.mat');
N=size(training,1);
N_V=size(validate,1);
M=3
W=zeros(M,1);
e=0;
X=Calculate_X(M,training);
X_V=Calculate_X(M,validate);
R=X*(X')/(N-M);
Lamda_Max=max(svd(R));
j=1
Mu=(1/Lamda_Max)/j;
W=train(W,e,X,Mu,training,M);
MSE=Calculate_MSE(validate,W,M,X_V,X);
OUTPUT(M-2,j)=MSE;