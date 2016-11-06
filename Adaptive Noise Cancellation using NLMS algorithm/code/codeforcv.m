clear;
load('project1.mat');
mu=0.1;
M=14;
x=2;
for i=1:1000
x=round(rand(1)*100)+1;
[e,w,pv,p]=cv(mu,M,primary,reference,x);
m=sum(p.^2);
mv=sum(pv.^2);
SNRo(i)=10*( log(m)- log(mv) );
end
plot(SNRo);
xlabel('Simulation number')
ylabel('ERLE or SNR')
OUTPUT=sum(SNRo)/1000;