function [PCA1,PCA2,PCA3,COEFF,SCORE] = CalculatePCA( X )
%Returns 3 principal componenets
[COEFF,SCORE] = pca(X);
PCA1=SCORE(:,1);
PCA2=SCORE(:,2);
PCA3=SCORE(:,3);
PCA1 = vec2mat(PCA1,50);
PCA2 = vec2mat(PCA2,50);
PCA3 = vec2mat(PCA3,50);


end

