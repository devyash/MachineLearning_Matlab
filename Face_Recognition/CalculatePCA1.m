function [PCA1,PCA2,PCA3,V, lamda] = CalculatePCA1(X)
normX=X-ones(2500,1)*mean(X);
Z=normX*normX';
[V, lamda]=eig(Z);
PCA1=V(:,2500);
PCA2=V(:,2499);
PCA3=V(:,2498);
PCA1 = vec2mat(PCA1,50);
PCA2 = vec2mat(PCA2,50);
PCA3 = vec2mat(PCA3,50);
end

