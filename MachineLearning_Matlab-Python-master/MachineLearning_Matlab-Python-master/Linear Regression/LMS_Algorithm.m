function [ MSE ] = LMS_Algorithm()
%Trying to implement LMS algorithm as per the algo provided
load ('training');
load ('validate.mat');
 N=length(training);
 Nv=length(validate);
 MSE=1;
  for M=2:30
     for lambda=0:0.5
        Y=training(M + 1 : N);
        X=zeros(M,N-M);
        for i=1:N-M
            X(:, i)=training(i+M-1: -1 : i);
        end
        R=X*(X')/(N-M);
        R=R +(lambda*eye(M));
        P=(X*(Y))/(N-M);
        W=inv(R)*P;
        for j=1:Nv-M
            MSE=MSE+(W*validate(Nv-i:-1:Nv-j-M +1)-validate(Nv-j+1)).^2;
        end
        MSE= MSE/(Nv-M);
     end
   end 

end

