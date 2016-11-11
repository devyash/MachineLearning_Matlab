function [J] = Calculate_J(U,X,V)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
J=0;
for j=1:3
    for i=1:150
        diff(1,i)=norm(V(j,:)-X(i,:));
        J=J+U(j,i)*diff(1,i);
    end
end

 

end

