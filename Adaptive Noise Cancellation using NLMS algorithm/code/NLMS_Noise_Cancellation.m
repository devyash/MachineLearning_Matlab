%Adaptive Noise Cancellation
clear;
load project1.mat;
%figure
%subplot(2,1,1);
%plot(primary);
%sound(primary,fs);
%title('Primary');
%subplot(2,1,2);
%plot(reference);
%title('Reference')
%sound(reference,fs);

%size of the input signal
N_P=size(primary,2);%NOISE + SIGNAL
N_R=size(reference,2); %NOISE

%2 Tap delay filter
Z=zeros(50,10);
%A=0;
M=18;
%A=A+1; 
M
W=zeros(M,1);

X_R=Calculate_X(primary,M);
Y_D=Calculate_D(reference,M);



%Calculating Maximum step size
%R=X_R'*X_R;
%Lamda_MAX=max(svd(R));
%Mu=(1/Lamda_MAX)/1000;

    Mu=0.009;

    %Calculating error and training
    [OUTPUTWEIGHTS,E,e]=Train(Y_D,Mu,X_R,N_R,M);
    %Z(A,i)=e^2;
    %subplot(2,1,3);
    %figure
    plot(E);
    %title('OUTPUT')
    sound(E,fs);

%end
%end
%surf(Z);

%plot(OUTPUTWEIGHTS);



    