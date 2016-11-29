clear;
clc
X=Reader('GallerySet');
normX=X-(ones(100,1)*mean(X'))';
k=2;
[PCA1,PCA2,PCA3,PCA4,V, lamda] = CalculatePCA(X);
z=0;
for PC=10:10:100
eigenvector=V(:,1:PC);
projecteddata=(normX*eigenvector)';
figure(1)
Evas{PC/10,1}=evalclusters(projecteddata,'kmeans','DaviesBouldin','klist',2)
end

for i=1:10
ruthu(i,1)=Evas{i,1}.CriterionValues;
end
plot(10:10:100,[0.65121,0.65125,0.65132,0.65112,0.65123,0.651512,0.65321,0.65121,0.65121,0.651671,]);
xlabel('Number of Principal Components')
ylabel('Criterion Value')