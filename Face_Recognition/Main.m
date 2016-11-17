clear;
clc;
X=Reader('ProbeSet');
Y=Reader('GallerySet');
%image(vec2mat(X(:,1),50))
normX=X-ones(2500,1)*mean(X);
[PCA1,PCA2,PCA3,COEFF,V] = CalculatePCA( normX );

%[PCA1,PCA2,PCA3,V, lamda] = CalculatePCA1(X);
%PrintPCA123( PCA1,PCA2,PCA3);
PC=10;
%COEFF= eigen vector
%eigenvector=SCORE(:,1:PC);
%normalise

normY=Y-ones(2500,1)*mean(Y);
eigenvector=V(:,1:PC);
projecteddata=(normX'*eigenvector)';
projectedtest=(normY'*eigenvector)';
a=Calculate_Set(projecteddata,projectedtest);
a=ceil(a./2);
count=0;
for i=1:size(a,1)
    if (a(i,1)==i)
        count=count+1;
    end
end
truepositive=count/size(a,1);
