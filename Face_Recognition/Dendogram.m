clear;
clc;
X=Reader('GallerySet');
k=2;
tree = linkage(X,'average');
figure()
dendrogram(tree)
ylabel('Height=Average of the unweighted Euclidean distances ')
xlabel('Nodes')
title('Dendogram')
