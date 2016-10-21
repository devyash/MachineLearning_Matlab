function [ V_C ] = Calculate_Variance(X_T,Mean_X_T_C,N_C,N)
%Returns the variance
V_C=zeros(7,7);
for i=1:N
V_C=V_C+sum((X_T(i,:)-Mean_X_T_C)*transpose(X_T(i,:)-Mean_X_T_C))/7;
end
%doubt here
V_C= V_C/N_C;

end

