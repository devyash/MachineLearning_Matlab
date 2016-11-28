function [] = PrintPCA123( PCA1,PCA2,PCA3,PCA4)
figure(1)
image(PCA1,'CDataMapping','scaled');
title('PCA 1');
figure(2)
image(PCA2,'CDataMapping','scaled')
title('PCA 2');
figure(3)
image(PCA3,'CDataMapping','scaled')
title('PCA 3');
figure(4)
image(PCA4,'CDataMapping','scaled')
title('Last Principal Component');
end

