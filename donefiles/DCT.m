%code takes the dct of a signal for sparse signal representation
A = imread('C:\Users\Lenovo\Desktop\moon.jpg');
A=imresize(A,[500,500],'bicubic');
A=rgb2gray(A);

x=double(A(:))

B=(dct(x));
% figure;
% subplot(2,2,1)
% % imagesc(reshape(B,60,60));
% plot((x));
% subplot(2,2,2)
% % imagesc(A);
% plot(dct(x));

for i = 1:size(B)
    if(B(i)<5)
         B(i)=0;
         
    end
    B(i)
end

 figure
 subplot(1,3,1)
 imshow(reshape(uint8(dct(x)),500,500));
 subplot(1,3,2)
 imshow(reshape(uint8(x),500,500));
 subplot(1,3,3)
 imshow(reshape(uint8(idct(B)),500,500));

