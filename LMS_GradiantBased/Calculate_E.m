function [e] = Calculate_E( W,i,data,M,X_V)
    Y_C=X_V(:,i)'*W;
    e=data(i+M)-Y_C;

end

