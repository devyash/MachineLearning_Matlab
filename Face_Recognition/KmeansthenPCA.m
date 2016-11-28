clear;
clc
load('matlab')
Y=VarName1;
for i=1:size(Y,1)
Y(i,1)=Y(i,1)-1;
end
k1 = find(Y);
for i=1:size(Y,1)
 if(Y(i,1)==0)
 Y(i,1)=1;
 elseif(Y(i,1)==1)
 Y(i,1)=0;
 end
end
k2=find(Y);
X=Reader('GallerySet');
maleset=X(:,[k1]);
femaleset=X(:,[k2]);

[probe,abs]=Reader('ProbeSet');
k=2;
idx = kmeans(probe',k);
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

z=0;
z1=0;
for i=1:size(newidx,1)
     if(strcmp(newidx{i,1},'male'))
         z=z+1;
     a(z,1)=Calculate_Set(probe(:,i),maleset);
     else
         z1=z1+1;
     b(z1,1)=Calculate_Set(probe(:,i),femaleset);
    end
end



