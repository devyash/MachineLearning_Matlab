function [PCA1,PCA2,PCA3,PCA4,COEFF,SCORE] = CalculatePCA( X )
%Returns 3 principal componenets

[COEFF,SCORE] = pca(X);
PCA1=SCORE(:,1);
PCA2=SCORE(:,2);
PCA3=SCORE(:,3);PCA4=SCORE(:,3);
PCA1 = reshape(PCA1,[50 50]);
PCA2 = reshape(PCA2,[50 50]);
PCA3 = reshape(PCA3,[50 50]);
PCA4 = reshape(PCA4,[50 50]);


end

