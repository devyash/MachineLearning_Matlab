
clear;
clc;
X=Reader('GallerySet');
k=2;
idx = kmeans(X',k);
Y=readtable('gender.txt');
male=0;
female=0;
for i=1:size(idx,1)
    if(idx(i,1)==1)
        male=male+1;
    elseif(idx(i,1)==2)
        female=female+1;
    end
end
maleop=0;
femaleop=0;
for i=1:size(Y,1)
    if strcmp('male',Y{i,2})
        maleop=maleop+1;
    elseif strcmp('female',Y{i,2})
        femaleop=femaleop+1;
    end
end
temp=0;
if(female>male)
temp=female;
female=male;
male=temp;
end

malePercent=(male/maleop)*100;
femalePercent=(female/femaleop)*100;

evalclusters(X,'kmeans','DaviesBouldin','klist',2:10)
evalclusters(X,'kmeans','CalinskiHarabasz','klist',2:10)
evalclusters(X,'kmeans','silhouette','klist',2:10)
evalclusters(X,'kmeans','gap','klist',2:10)