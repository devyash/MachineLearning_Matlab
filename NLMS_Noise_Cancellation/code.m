clear;
load('project1.mat');
mu=0.1;
M=14;
[e,w]=nlms1(mu,M,primary,reference);
plot(1:70000,e);
title('Error or the desired signal');
sound(e,fs);
