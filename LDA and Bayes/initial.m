clear;
load('data.mat');
N=140;
[X_T,X_V]=Create_X(FrontalLip,RearWidth,Length,Width,Depth,Male,Female,N);
%N C1
N_C1=Calculate_NJ(Species,N);
N_C2=N-N_C1;

%Prior Probabilities
PP_C1=N_C1/N;
PP_C2=1-PP_C1;

%Calculate X_C
X_C1=Calculate_X_C(X_T,1,N_C1,Species);
X_C2=Calculate_X_C(X_T,0,N_C2,Species);

%[Mean_X_T_C1, Mean_X_T_C2]=Calculate_Mean(Species,X_T,N,N_C1,N_C2);
Mean_X_T_C1=Calculate_Mean(X_C1,N_C1);
Mean_X_T_C2=Calculate_Mean(X_C2,N_C2);

%Variance
V_C1=Calculate_Variance(X_C1,Mean_X_T_C1,N_C1);
V_C2=Calculate_Variance(X_C2,Mean_X_T_C2,N_C2);

%Discriminat function
G_C1=Calculate_G(X_V,Mean_X_T_C1,V_C1,PP_C1);
G_C2=Calculate_G(X_V,Mean_X_T_C2,V_C2,PP_C2);
OUTPUT_C=Calculate_OUTPUT(G_C1,G_C2);
Accuracy=Calculate_Accuarcy(OUTPUT_C,Species)