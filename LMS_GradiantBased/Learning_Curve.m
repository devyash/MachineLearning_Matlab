%Plotting the learning curve for best step size=0.003959 and best filter order=3 
%step size2=0.0007918 &step size3=0.0003959
%Iterations vs the cost

clear;
load ('training.mat');
load('validate.mat');
N=size(training,1);
N_V=size(validate,1);
M=3;
W=zeros(M,1);
X_T=Calculate_X(M,training);
D_T=Calculate_D(M,validate);
X_V=Calculate_X(M,validate);
D_V=Calculate_D(M,validate);
R=X_T*(X_T')/(N-M);
Lamda_Max=max(svd(R));
<<<<<<< HEAD
j=700;
Mu=0.003959;
[W,OUTPUT]=train(W,X_T,Mu,training,M);
Mu=0.003959/3;
W=zeros(M,1);
[W,OUTPUTB]=train(W,X_T,Mu,training,M);
Mu=0.003959/6;
W=zeros(M,1);
[W,OUTPUTC]=train(W,X_T,Mu,training,M);

plot(1:N-M,OUTPUT);
legend('Optimum','Step size A','Step size B')
xlabel('Iterations');
ylabel('MSE');
    

=======
j=1500;
Mu=(1/Lamda_Max)/j;
[W,OUTPUT]=train(W,e,X,Mu,training,M);
j=1300;
Mu=(1/Lamda_Max)/j;
W=zeros(M,1);
[W,OUTPUTA]=train(W,e,X,Mu,training,M);
j=500;
Mu=(1/Lamda_Max)/j;
W=zeros(M,1);
[W,OUTPUTB]=train(W,e,X,Mu,training,M);
plot(1:N-M,OUTPUT,1:N-M,OUTPUTA,1:N-M,OUTPUTB)
legend('Step size A',' Step Size B',' StepSize Optimal');
>>>>>>> Master
