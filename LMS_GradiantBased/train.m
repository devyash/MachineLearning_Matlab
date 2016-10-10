function [W,OUTPUT] = train(W,e,X,Mu,training,M)
    N=size(training,1);
    OUTPUT=zeros(N-M,1);
    for i=1:N-M
        %N_f=(X(:,i)'*X(:,i));
        N_f=1;
        e=Calculate_E( W,i,training,M,X);
        OUTPUT(i,1)=(e)^2;
        W=Calculate_W(W,Mu,e,X,i,M,N_f);
    end
    %figure
    %plot(E)
end

