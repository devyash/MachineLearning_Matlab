function [ a ] =Calculate_Set(projecteddata,projectedtest)
a=zeros(size(projectedtest,2),1);
for i=1:size(projectedtest,2)
    temp=999999999999999999999;
    for j=1:size(projecteddata,2)
    d=0;
    d = norm((projecteddata(:,j)-projectedtest(:,i)),2);
    if(temp>d)
        temp=d;
        a(i,1)=j;
    end
    
    end
end

end

