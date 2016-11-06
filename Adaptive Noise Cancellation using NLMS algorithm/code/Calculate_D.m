function [D] = Calculate_D( data,M )
%Shifted signal by the order;
N=size(data,2);
D=zeros(1,N-M);
for i=1:N-M
 D(1,i)=data(1,i+M);
end


end

