c=imread("C:\Users\Lenovo\Desktop\apple-2.jpeg");
[a,h,v,d]=haart2(c);
figure
subplot(2,2,1);
imagesc(d{1});
title('diagonal level details');
subplot(2,2,2);
imagesc(h{1});
title('horizontal level details');
subplot(2,2,3);
a


