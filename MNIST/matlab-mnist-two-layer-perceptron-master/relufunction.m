function y = relufunction(x)
% simpleLogisticSigmoid Logistic sigmoid activation function
% 
% INPUT:
% x     : Input vector.
%
% OUTPUT:
% y     : Output vector where the relu function was applied element by
% element.
%
if(x<=0)
y=0;
else
y=x;
end

end