function [ X_T,X_V ] = Create_X(FrontalLip,RearWidth,Length,Width,Depth,Male,Female,N)
%Returns a feature matrix
X=zeros(200,7);
T_N=size(FrontalLip,1);

for n=1:N
X_T(n,:)=[FrontalLip(n,1),RearWidth(n,1),Length(n,1),Width(n,1),Depth(n,1),Male(n,1),Female(n,1)];
end
i=0;
for n=N:T_N
i=i+1;
X_V(i,:)=[FrontalLip(i,1),RearWidth(i,1),Length(i,1),Width(i,1),Depth(i,1),Male(i,1),Female(i,1)];
end
if(N==200)
X_V=0;
end
