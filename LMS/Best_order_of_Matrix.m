function []=Best_order_of_Matrix(data)
  E_m=100000000000000000000;
  E_min=0;
  for m=3:30
    n=1;
    for i=1:5
       [m,i]
       lamda=i*0.0198+0.001;
       X=Calculate_Matrix(data,m);
       X_T=X';
       R=X_T*X;
       P=X_T*data;
       W=inv(R+lamda*eye(m))*P;
       Y_C=X*W;
       E(m-2,i)=sum((Y_C-data).^2);
       n=n+1;
       if(E_m>E(m-2,i))
         E_m=E(m-2,i);
         m_min=m;
       end
    end
      E_m
  end
  
   size(0.0208:0.0198:0.1);
   size(3:30);
   size(E);
   surf(0.0208:0.0198:0.1,3:30,E)
   
 end