clear;
load ('training.mat');
load('validate.mat');
N=size(training,1);
N_V=size(validate,1);

for M=3:30
    W=zeros(M,1);
    e=0;
    X=Calculate_X(M,training);
    X_V=Calculate_X(M,validate);
    R=X*(X')/(N-M);
    Lamda_Max=max(svd(R));
    for j=1:10
            Mu=(1/Lamda_Max)/j;
            W=train(W,e,X,Mu,training,M);
            MSE=Calculate_MSE(validate,W,M,X_V,X);
            OUTPUT(M-2,j)=MSE;
    end  
end
surf(((1/Lamda_Max)*((1:10).^-1)),3:30,OUTPUT)
xlabel('Step Size');
ylabel('Filter Order');
zlabel('Cost function');
    

