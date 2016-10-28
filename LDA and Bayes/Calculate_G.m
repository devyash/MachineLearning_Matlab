function [g] = Calculate_G(X_T,X_V,Mean_X_T_C1,V_C1,PP_C1)
%Returns Gj(x)
N=size(X_V,2);
Cov=0;%(At that moment)
d=7;%dimension
G=-1*transpose(X_V-Mean_X_T_C1)*inv(V_C1)*(X_V-Mean_X_T_C1)-((d/2)*log(2*pi))-1/2*log(Cov)+log(PP_C1);

end

