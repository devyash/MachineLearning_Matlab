function [W] = train(W,e,X,Mu,training,M)
    N=size(training,1);
    for i=1:N-M
        e=Calculate_E( W,i,training,M,X);
        W=Calculate_W(W,Mu,e,X,i);
    end
end

