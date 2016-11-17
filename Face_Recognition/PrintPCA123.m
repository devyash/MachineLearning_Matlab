function [] = PrintPCA123( PCA1,PCA2,PCA3)
figure
image(PCA1,'CDataMapping','scaled');
figure
image(PCA2,'CDataMapping','scaled')
figure
image(PCA3,'CDataMapping','scaled')
end

