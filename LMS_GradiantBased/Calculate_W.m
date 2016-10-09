function [ newW ] = Calculate_W(W,Mu,e,X,i)
newW = W + Mu*e*X(:,i);
end

