function [ W ] = Calculate_W(W,Mu,e,X,i,M,N_f)
for k=1:M
W(k) = W(k) + Mu*e*X(k,i)/N_f;
end
end

