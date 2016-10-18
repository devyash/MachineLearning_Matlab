function [OUTPUTWEIGHTS,E,e] = Train(Y_D,Mu,X_R,N_R,M)
%Returns trained W and all the Errors
OUTPUTWEIGHTS=zeros(M,N_R-M);
W=zeros(M,1);
E=zeros(N_R-M,1);
for i=1:N_R-M
    %Calculate Y_CAP for Reference Signal
    Y_CAP=Calculate_YCAP(X_R,W,i);
    
    %Calculate Error for Reference Signal
    e=Y_D(i)-Y_CAP;
    E(i,1)=e;
    N_F=trace(X_R(i,:)*X_R(i,:)');
    %N_F=1;
    W=W+(Mu*e*X_R(i,:)'/N_F);
    OUTPUTWEIGHTS(:,i)=W;
end

end

