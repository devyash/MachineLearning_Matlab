function []=Q2(data,t)
     m=30;
     X=Calculate_Matrix(data,m);
     X_T=X';
     R=X_T*X;
     P=X_T*data;
     W=inv(R)*P;
     Xtest = Calculate_Matrix(t,m)
     Y_C=Xtest*W;
     E=Y_C-t;
     
     

     
    plot(0:999,t,0:999,E)
end