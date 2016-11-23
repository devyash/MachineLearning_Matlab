clear;clc;
X=[ 1,0;0,1;-1,0;0,-1;0.5,0.5;-0.5,0.5;0.5,-0.5;-0.5,-0.5];
Y=[1;1;1;1;0;0;0;0];
W2= randn(3,4);
W3= randn(1,5);
m=8;

k=0;

k=k+1;
[W2,W3] = train(W2,W3,X,Y,m,1000,3);
for i = 1:100
testmatrix=randn(8,2);
[OUTPUT] = test(testmatrix,m,W2,W3);
end
[OUTPUT] = test(X,m,W2,W3);
[correctness(k,1)]= Correctness(OUTPUT,Y,m);

