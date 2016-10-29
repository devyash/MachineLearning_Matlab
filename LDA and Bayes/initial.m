clear;
load('data.mat');
N=140;
[X_T,X_V]=Create_X(FrontalLip,RearWidth,Length,Width,Depth,Male,Female,N);
X=[X_T;X_V];
%N C1
N_C1=Calculate_NJ(Species,N);
N_C0=N-N_C1;

%Prior Probabilities
PP_C1=N_C1/N;
PP_C0=1-PP_C1;

%Calculate X_C
X_C1=Calculate_X_C(X_T,1,N_C1,Species);
X_C0=Calculate_X_C(X_T,0,N_C0,Species);

%[Mean_X_T_C1, Mean_X_T_C0]=Calculate_Mean(Species,X_T,N,N_C1,N_C0);
Mean_X_T_C1=Calculate_Mean(X_C1,N_C1);
Mean_X_T_C0=Calculate_Mean(X_C0,N_C0);

%Variance
V_C1=Calculate_Variance(X_C1,Mean_X_T_C1,N_C1);
V_C0=Calculate_Variance(X_C0,Mean_X_T_C0,N_C0);

tic
%Valdiation
%Discriminat function for Validation Data Set 
G_C1=Calculate_G(X_V,Mean_X_T_C1,V_C1,PP_C1);
G_C0=Calculate_G(X_V,Mean_X_T_C0,V_C0,PP_C0);
OUTPUT_C=Calculate_OUTPUT(G_C1,G_C0);
Accuracy=Calculate_Accuarcy(OUTPUT_C,Species)
toc

tic
%Training
%Discriminat function for total dataset
G_C1=Calculate_G(X_T,Mean_X_T_C1,V_C1,PP_C1);
G_C0=Calculate_G(X_T,Mean_X_T_C0,V_C0,PP_C0);
OUTPUT_C=Calculate_OUTPUT(G_C1,G_C0);
Accuracy=Calculate_Accuarcy2(OUTPUT_C,Species)
toc
%total
%Discriminat function for total dataset
G_C1=Calculate_G(X,Mean_X_T_C1,V_C1,PP_C1);
G_C0=Calculate_G(X,Mean_X_T_C0,V_C0,PP_C0);
OUTPUT_C=Calculate_OUTPUT(G_C1,G_C0);
Accuracy=Calculate_Accuarcy2(OUTPUT_C,Species)
toc

tic
OUTPUT_LDA=Calculate_LDA(X_V,V_C1,V_C0,Mean_X_T_C1,Mean_X_T_C0);
Accuracy=Calculate_Accuarcy(OUTPUT_LDA,Species)
toc

tic
OUTPUT_LDA=Calculate_LDA(X_T,V_C1,V_C0,Mean_X_T_C1,Mean_X_T_C0);
Accuracy=Calculate_Accuarcy2(OUTPUT_LDA,Species)
toc


tic
OUTPUT_LDA=Calculate_LDA(X,V_C1,V_C0,Mean_X_T_C1,Mean_X_T_C0);
Accuracy=Calculate_Accuarcy2(OUTPUT_LDA,Species)
toc