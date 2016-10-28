clear;
load('data.mat');
N=140;
[X_T,X_V]=Create_X(FrontalLip,RearWidth,Length,Width,Depth,Male,Female,N);
%N C1
N_C1=Calculate_NJ(Species,N);
N_C2=N-N_C1;
[Mean_X_T_C1, Mean_X_T_C2]=Calculate_Mean(Species,X_T,N,N_C1,N_C2);

%Prior Probabilities
PP_C1=N_C1/N;
PP_C2=1-PP_C1;

%Variance
V_C1=Calculate_Variance(X_T,Mean_X_T_C1,N_C1,N);
V_C2=Calculate_Variance(X_T,Mean_X_T_C2,N_C2,N);

G_C1=Calculate_G(X_T,X_V,Mean_X_T_C1,V_C1,PP_C1);
