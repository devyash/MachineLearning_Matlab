load fisheriris
X = meas;
k=3;

for k=2:10
[idx,C,sumd,D] = kmeans(X,k)
for i=1:k
z=(max(D));
Vd(i)=min(min(sumd)/z(i))
end
end
%tree = linkage(X,'average');

%figure()
%dendrogram(tree)
