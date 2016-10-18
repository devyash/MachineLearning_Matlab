function [e,w,W]=nlms1(mu,M,primary,reference)
w=zeros(M,1);
N=length(primary);

%make sure that primary and reference are column vectors
primary=primary(:);
reference=reference(:);


W=zeros(2,N-M);

%NLMS
for n=M:N
x=primary(n:-1:n-M+1);
W(1,n)= w(1,1);
W(2,n)= w(2,1);

e(n)=reference(n)-w'*x;
w=w+mu/(x'*x)*x*conj(e(n));
end
 
