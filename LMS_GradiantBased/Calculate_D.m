function [D] = Calculate_D( M,data )
N=size(data,1);
D=zeros(N-M,1);
for i1=1:N-M
D(i1)=data(i1+M,1);
end
end
