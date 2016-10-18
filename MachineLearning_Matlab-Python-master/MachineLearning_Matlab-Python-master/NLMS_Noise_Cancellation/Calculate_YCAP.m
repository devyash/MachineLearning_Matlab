function [Y_CAP] = Calculate_YCAP(X_R,W,i)
%Return Y=WX
Y_CAP=W'*X_R(i,:)';

end

