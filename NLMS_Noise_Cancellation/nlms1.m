function [e,w]=nlms1(mu,M,primary,reference)
w=zeros(M,1);
N=length(primary);

%make sure that primary and reference are colon vectors
primary=primary(:);
reference=reference(:);

%W=zeros(M,N-M);
%NLMS
for n=M:N
uvec=primary(n:-1:n-M+1);
e(n)=reference(n)-w'*uvec;
%W(:,n-M+1)=w;
w=w+mu/(uvec'*uvec)*uvec*conj(e(n));
end

