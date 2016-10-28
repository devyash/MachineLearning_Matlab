function [ X_T,X_V ] = Create_X(FrontalLip,RearWidth,Length,Width,Depth,Male,Female,N)
%Returns a feature matrix
X=zeros(200,7);
T_N=size(FrontalLip,1);

for n=1:N
X_T(n,:)=[FrontalLip(n,1),RearWidth(n,1),Length(n,1),Width(n,1),Depth(n,1),Male(n,1),Female(n,1)];
end
i=0;
for n=N+1:T_N
i=i+1;
X_V(i,:)=[FrontalLip(n,1),RearWidth(n,1),Length(n,1),Width(n,1),Depth(n,1),Male(n,1),Female(n,1)];
end
if(N==200)
X_V=0;
end
