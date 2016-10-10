function [ newW ] = Calculate_W(W,Mu,e,X,i,N_f)
newW = W + Mu*e*X(:,i)/N_f;
end

