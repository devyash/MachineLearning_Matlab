function [W] = train(W,e,X,Mu,training,M)
    N=size(training,1);
    for i=1:N-M
        N_f=(X(:,i)'*X(:,i));
        e=Calculate_E( W,i,training,M,X);
        W=Calculate_W(W,Mu,e,X,i,N_f);
    end
end

