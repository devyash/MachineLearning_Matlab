function [Mean_X_C]=Calculate_Mean(X_C,N_C)
%returns a matrix of mean
Mean_X_C=zeros(1,7);

for n=1:N_C
    for c=1:7
     Mean_X_C(1,c)= Mean_X_C(1,c)+X_C(n,c);
    end
end

Mean_X_C=Mean_X_C./N_C;

end
