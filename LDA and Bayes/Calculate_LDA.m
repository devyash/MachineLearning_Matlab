function [OUTPUT_C ] = Calculate_LDA(X,V_C1,V_C0,Mean_X_T_C1,Mean_X_T_C0)
%LDA Classifier
%Returns G(x)
T=-4;
Value1=pinv((V_C1+V_C0)*0.5)*transpose(Mean_X_T_C1-Mean_X_T_C0);
Value2=0.5*Mean_X_T_C0*pinv(V_C0)*transpose(Mean_X_T_C0)-0.5*Mean_X_T_C1*pinv(V_C1)*transpose(Mean_X_T_C1)+T;
N=size(X,1);
OUTPUT_C=zeros(N,1);

for i=1:N
if(X(i,:)*Value1>Value2)
        OUTPUT_C(i,1)=1;
    else
        OUTPUT_C(i,1)=0;
    end
end

end

