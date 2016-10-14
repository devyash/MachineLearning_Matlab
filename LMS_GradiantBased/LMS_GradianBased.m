clear;
load ('training.mat');
load('validate.mat');
N=size(training,1);
N_V=size(validate,1);
<<<<<<< HEAD
OUTPUT=zeros(28,10);
=======
OUTPUT=zeros(10,10);

>>>>>>> Master
for M=3:30
    W=zeros(M,1);
    X_T=Calculate_X(M,training);
    D_T=Calculate_D(M,training);
    X_V=Calculate_X(M,validate);
    D_V=Calculate_D(M,validate);
    R=X_T*(X_T')/(N-M);
    Lamda_Max=max(svd(R));
    for j=1:10
            Mu=(1/Lamda_Max)/j;
<<<<<<< HEAD
            [W,ZB]=train(W,X_T,Mu,training,M);
            W=flipud(W);
=======
            W=train(W,e,X_T,Mu,training,M);
>>>>>>> Master
            MSE=Calculate_MSE(validate,W,M,X_V,X_T);
            OUTPUT(M-2,j)=MSE;
    end  
end
surf(((1/Lamda_Max)*((1:10).^-1)),3:30,OUTPUT)
xlabel('Step Size: 1:1/LamdaMax');
ylabel('Filter Order: 3:30');
zlabel('Cost function(J)');
    

