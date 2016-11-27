function [ I ] =Calculate_Set(projecteddata,projectedtest)
for i=1:size(projecteddata,2)
    d(i,:)=pdist2(projectedtest',projecteddata(:,i)');
end
  [m,I]=min(d);
    I=I';
end

