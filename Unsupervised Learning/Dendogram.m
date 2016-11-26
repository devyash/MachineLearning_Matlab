clc;
clear;
load fisheriris
X = meas;
k=3;
tree = linkage(X,'average');
figure()
dendrogram(tree)
ylabel('Height=Average of the unweighted Euclidean distances ')
xlabel('Nodes')
title('Dendogram')
