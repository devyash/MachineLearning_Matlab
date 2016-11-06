function [X] = Calculate_X(data,M)
%Returns a row matrix using the delay line in the format [X3 X2 X1; X4 X3 X2......;XN-M XN-M...XN]
 N=size(data,2);
 X=zeros(N-M,M);
        for i=1:N-M
            X(i,:)=data(:,i+M-1: -1 : i);
        end 
end

