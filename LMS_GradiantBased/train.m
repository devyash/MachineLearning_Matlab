function [W,OUTPUT] = train(W,X_T,Mu,training,M)
    N=size(training,1);
    for i=1:N-M
        %N_f=(X(:,i)'*X(:,i));
        N_f=1;
        e=Calculate_E( W,i,training,M,X_T);
        OUTPUT(i)=e;
        W=Calculate_W(W,Mu,e,X_T,i,N_f);
    end
end

