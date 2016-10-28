function [X_C] = Calculate_X_C(X_T,class,N_C,Species)
%returns the correlation for specific class
N=size(X_T,1);
X_C=zeros(N_C,7);
k=0;
for n=1:N
if(Species(n) == class)
    k=k+1;
    X_C(k,:)=X_T(n,:);
end
end

