function [ newV ] = Calculate_V(V,X)
k=size(V,1);
f=4; %feature
k1=cell(1,k);
k1=0,k2=0,k3=0;
count1=0;
count2=0;
count3=0;
for i=1:150
    temp=zeros(1,k);
    for j=1:k
       temp(1,j)=norm(X(i,:)-V(j,:));
    end
    [M,I]=min(temp);
    if I==1
        count1=count1+1;
        k1=k1+X(i,:);
    end
    if I==2
        count2=count2+1;
        k2=k2+X(i,:);
    end
    if I==3
        count3=count3+1;
        k3=k3+X(i,:);
    end
    
end
newV=[k1/count1;k2/count2;k3/count3];

end

