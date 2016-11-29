clear;
clc;
[X,f]=Reader('GallerySet');
[Y,abs]=Reader('ProbeSet');





normX=X-(ones(100,1)*mean(X'))';
%figure(1)
%image(reshape(mean(X')',[50 50]),'CDataMapping','scaled')
%title('Mean Face');
%[PCA1,PCA2,PCA3,PCA4,COEFF,V] = CalculatePCA( normX );

[PCA1,PCA2,PCA3,PCA4,V, lamda] = CalculatePCA1(X);
%  PrintPCA123( PCA1,PCA2,PCA3,PCA4);
z=0;
for PC=10:10:100
    z=z+1;
    %Score=projection of X on principal component
    %Coeff=Principle components
    %COEFF= eigen vector
    %eigenvector=SCORE(:,1:PC);
    %normalise

normY=Y-(ones(200,1)*mean(X'))';
%eigenvector=V(:,1:PC);
eigenvector=V(:,2501-PC:2500);
projecteddata=(normX'*eigenvector)';
projectedtest=(normY'*eigenvector)';
a=Calculate_Set(projecteddata,projectedtest);

count=0;
for i=1:size(a,1)
    temp=i;
    temp=ceil(temp/2);
    if (a(i,1)==temp)
    else
         count=count+1;
    end
end
truenegative(z,1)=count/size(a,1);
falsenegative(z,1)=1-count/size(a,1);

end

%without PCA repeat the above step
a=Calculate_Set(X,Y);
count=0;
for i=1:size(a,1)
    temp=i;
    temp=ceil(temp/2);
    if (a(i,1)==temp)
        count=count+1;
    end
end
truepositivewithoutPCA=count/size(a,1);
% figure
% subplot(2,1,1);
% image(reshape(Y(:,1),[50 50]),'CDataMapping','scaled')
% xlabel('pixels')
% ylabel('pixels')
% title('Original Face')
% subplot(2,1,2);
% image(reshape(eigenvector*projectedtest(:,1),[50 50]),'CDataMapping','scaled')
% xlabel('pixels')
% ylabel('pixels')
% title('Reconstructed Face')



plot(10:10:100,truenegative)
xlabel('Number of Principal Components')
ylabel('True Negative')
title('True Negative vs PCA')