function [PCA1,PCA2,PCA3,PCA4,V, lamda] = CalculatePCA1(X)
normX=X-ones(2500,1)*mean(X);
Z=normX*normX';
[V, lamda]=eig(Z);
PCA1=V(:,2500);
PCA2=V(:,2499);
PCA3=V(:,2498);
PCA4=V(:,1);
PCA1 = reshape(PCA1,[50 50]);
PCA2 = reshape(PCA2,[50 50]);
PCA3 = reshape(PCA3,[50 50]);
PCA4 = reshape(PCA4,[50 50]);
end

