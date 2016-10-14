clear;
load('project1.mat');
mu=0.009;
M=30;
[e,w]=nlms1(mu,M,primary,reference);
sound(e,fs);