function [MSE] = Calculate_MSE(validate,W,M,X_V);
N=size(validate,1);    
for i=1:N-M
    Y_C=X_V(:,i)'*W;
    MSE=sum(validate(i+M)-Y_C);
end

end


