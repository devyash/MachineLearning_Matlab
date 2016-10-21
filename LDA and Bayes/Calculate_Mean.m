function [Mean_X_C1, Mean_X_C2]=Calculate_Mean(Species,X,N,N_C1,N_C2)
%returns a matrix of mean
Mean_X_C1=zeros(1,7);
Mean_X_C2=zeros(1,7);
for n=1:N
    for c=1:7
         if(Species(n)==1)
            Mean_X_C1(1,c)= Mean_X_C1(1,c)+X(N,c);
         end
         if(Species(n)==0)
            Mean_X_C2(1,c)= Mean_X_C2(1,c)+X(N,c);
         end
    end
end

Mean_X_C1=Mean_X_C1./N_C1;
Mean_X_C2=Mean_X_C2./N_C2;


end
