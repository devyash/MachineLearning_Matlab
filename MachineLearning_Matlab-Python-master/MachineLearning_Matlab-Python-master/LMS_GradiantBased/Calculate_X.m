function X = Calculate_X(M,training)
 N=size(training,1);
 X=zeros(M,N-M);
        for i=1:N-M
            X(:, i)=training(i+M-1: -1 : i);
        end
 end