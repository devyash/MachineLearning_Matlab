function [ V_C ] = Calculate_Variance(X_C,Mean_X_T_C,N_C)
%Returns the variance
V_C=zeros(7,7);
for i=1:N_C
V_C=V_C+transpose(X_C(i,:)-Mean_X_T_C)*(X_C(i,:)-Mean_X_T_C);
end
%doubt here
V_C= V_C/N_C;

end
