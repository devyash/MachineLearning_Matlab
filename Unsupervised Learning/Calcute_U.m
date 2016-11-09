function [U] = Calcute_U(V,X)
%UNTITLED4 Summary of this function goes here
k=size(V,1);
f=4; %feature
U=zeros(k,150);
for i=1:150
    temp=zeros(1,k);
    for j=1:k
       temp(1,j)=norm(X(i,:)-V(j,:));
    end
    [M,I]=min(temp);
    U(I,i)=1;
end

end

