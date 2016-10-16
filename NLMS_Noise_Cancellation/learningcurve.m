    clear;
    load('project1.mat');
    M=50;
    %------------------------------------------------------------------
    mu=0.1;
    [e,w]=nlms1(mu,M,primary,reference);
    figure
    %subplot(3,1,1);
    plot(1:70000,e.^2);
    xlabel('Iterations               Step size(Less then optimum)');
    ylabel('MSE');
    sound(e,fs);
    %-------------------------------------------------------------------
    mu=0.1;
    [e,w]=nlms1(mu,M,primary,reference);
    subplot(3,1,2);
    plot(1:70000,e.^2);
    xlabel('Iterations               Step size (optimum)');
    ylabel('MSE');
    sound(e,fs);
    %--------------------------------------------------------------------
    mu=1;
    [e,w]=nlms1(mu,M,primary,reference);
    subplot(3,1,3);
    plot(1:70000,e.^2);
    xlabel('Iterations               Step size(Large)');
    ylabel('MSE');
    %sound(e,fs);