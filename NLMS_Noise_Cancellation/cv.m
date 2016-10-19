function [e,w,pv,p]=cv(mu,M,primary,reference,x)
w=zeros(M,1);
N=length(primary);
Z=round(N-(N-M)/x);

%make sure that primary and reference are column vectors
primary=primary(:);
reference=reference(:);


%W=zeros(2,N-M);

%NLMS
for n=M:N-Z
i=0;
x=primary(n:-1:n-M+1);
%W(1,n)= w(1,1);
%W(2,n)= w(2,1);
i=1+i;
e(i)=reference(n)-w'*x;
w=w+mu/(x'*x)*x*conj(e(i));
end
i=0;
for n=N-Z+1:N
x=primary(n:-1:n-M+1);
i=1+i;
pv(i)=reference(n)-w'*x;
p(i)=reference(n,1);
end
