function [e] = Calculate_E( W,i,data,M,X)
    Y_C=X(:,i)'*W;
    e=data(i+M)-Y_C;

end

