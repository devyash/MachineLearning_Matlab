%Cost vs Filter order vs step size
clear;
load('project1.mat');
i=1;
E=zeros(49,10);
for M=2:50;
i=i+1;
j=1;
for mu=0.01:0.01:0.1;
[e,w]=nlms1(mu,M,primary,reference);
E(i,j)=sum(e.^2);
end
end
surf(E);
%title('Error or the desired signal');
%sound(e,fs);