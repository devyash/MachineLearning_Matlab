function [W,E] = train(W,e,X,Mu,training,M)
    N=size(training,1);
    E=zeros(N-M,1);
    for i=1:N-M
        %N_f=(X(:,i)'*X(:,i));
        N_f=1;
        e=Calculate_E( W,i,training,M,X);
        E(i)=Calculate_E( W,i,training,M,X);
        W=Calculate_W(W,Mu,e,X,i,M,N_f);
    end
    %figure
    %plot(E)
end

