function [G] = Calculate_G(X_V,Mean_X_T_C1,V_C1,PP_C1)
%Returns Gj(x)
N=size(X_V,1);
Sigma_I=V_C1;%(At that moment)
d=7;%dimension
G=zeros(1,N);
Sigma_J=pinv(V_C1);
const=-((d/2)*log(2*pi))-1/2*log(abs(det(Sigma_I)))+log(PP_C1);
for i=1:N
G(1,i)=-1/2*(X_V(i,:)-Mean_X_T_C1)*Sigma_J*transpose(X_V(i,:)-Mean_X_T_C1)+const; 
end
end

