function [ OUTPUT_C ] = Calculate_OUTPUT(G_C1,G_C2)
%Returns the species
N=size(G_C1,2);
OUTPUT_C=zeros(N,1);
for i=1:N
    if(G_C1(1,i)>G_C2(1,i))
        OUTPUT_C(i,1)=1;
    else
        OUTPUT_C(i,1)=0;
    end
end   

end

