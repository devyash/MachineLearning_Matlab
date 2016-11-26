clear;
clc;
X=Reader('ProbeSet');
Y=Reader('GallerySet');
%image(vec2mat(X(:,1),50))
normX=X-ones(2500,1)*mean(X);
%[PCA1,PCA2,PCA3,COEFF,V] = CalculatePCA( normX );

[PCA1,PCA2,PCA3,V, lamda] = CalculatePCA1(X);
%PrintPCA123( PCA1,PCA2,PCA3);
z=0;
for PC=10:10:100
    z=z+1;
%COEFF= eigen vector
%eigenvector=SCORE(:,1:PC);
%normalise

normY=Y-ones(2500,1)*mean(Y);
eigenvector=V(:,1:PC);
%eigenvector=V(:,2501-PC:2500);
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
truepositive(z,1)=count/size(a,1);



%without PCA repeat the above step
a=Calculate_Set(X,Y);
z=0;
count=0;
for PC=10:10:100
    z=z+1;
for i=1:size(a,1)
    if (a(i,1)==i)
        count=count+1;
    end
end
truepositive(z,1)=count/size(a,1);
end
end


%Clustering
