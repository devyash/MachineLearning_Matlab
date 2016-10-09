function [MSE] = Calculate_MSE(validate,W,M,X_V,X)
N=size(validate,1);   
Y_C=X_V'*W;
%N_f=(X(:,i)'*X(:,i));
MSE=0;
for i=1:N-M
    MSE=MSE+(((validate(i+M)-Y_C(i))^2));
end
    MSE=MSE/size(Y_C,1);

end


