% Things this code will do
% 1. load the test data
% 2. Cluster the test data
% 3, Allocate each cluster as male or female based on larger value
% 4. for each cluster output value check if 
%     a) true postive
%     b) false postive
% 5

range(1)
clear;
clc
load('gallery')
ABS=male;
X=Reader('GallerySet');
normX=X-(ones(100,1)*mean(X'))';
k=2;
[PCA1,PCA2,PCA3,PCA4,V, lamda] = CalculatePCA1(X);
z=0;
for PC=10:10:100
z=z+1;
eigenvector=V(:,2501-PC:2500);
projecteddata=(normX'*eigenvector)';
idx = kmeans(projecteddata',k);
male=0;
female=0;
for i=1:size(idx,1)
    if(idx(i,1)==1)
        male=male+1;
    elseif(idx(i,1)==2)
        female=female+1;
    end
end
temp=0;
flag=0;
if(female>male)
temp=female;
female=male;
male=temp;
flag=1;
end


if(flag==0)
for i=1:size(idx,1)
    if(idx(i,1)==1)
        newidx{i,1}='male';
    elseif(idx(i,1)==2)
        newidx{i,1}='female';
    end
end
end

if(flag==1)
for i=1:size(idx,1)
    if(idx(i,1)==2)
        newidx{i,1}='male';
    elseif(idx(i,1)==1)
        newidx{i,1}='female';
    end
end
end
suyog(:,:,z)=confusionmat(ABS,newidx);
truehu=0;
for i=1:size(newidx,1)
    if(strcmp(newidx{i,1},ABS{i,1}))
        truehu=truehu+1;
    end
end
Rr(z,1)=truehu;
end
plot(10:10:100,Rr);
title('Accuracy of Kmeans Classification Vs Number of Principal Components');
xlabel('Number of Principal Components')
ylabel('Recognition Rate')

% TP=suyog(1,1,i);
% FP=suyog(2,1,i);
% FN=suyog(1,2,i);
% P=TP/(TP+FP);
% R=TP/(TP+FN);
% F=(P*R)/(P+R)