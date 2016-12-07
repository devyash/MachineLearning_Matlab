function y = drelufunction(x)
% dLogisticSigmoid Derivative of the logistic sigmoid.
% 
% INPUT:
% x     : Input vector.
%
% OUTPUT:
% y     : Output vector where the derivative of the relu function was
% applied element by element.
%
    if(x<=0)
        y=0.01;
    else
        y=1;
    end

end