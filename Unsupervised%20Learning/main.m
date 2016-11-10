clear;
load('fisheriris');
k=4;
X=meas;
z=randi(112);
V=X(z:z+k-1,:);
for i=1:10
U=Calcute_U(V,X);
J=Calculate_J(U,X,V);
V=Calculate_V(V,X);
OUTPUT(i,1)=J;
end
plot(OUTPUT)

