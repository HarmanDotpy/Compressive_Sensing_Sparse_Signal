clc
close all
tic 
A=imread("C:\Users\Lenovo\Desktop\apple-2.jpeg");
A=imresize(A,[60,60],'bicubic');

C=imbinarize(rgb2gray(A));
%x=C(:);
%n=length(x)

%calculate dft for image A using fft algorithm
xf=fft(A(:)); %3600*1
n=length(x);%n=3600
m=600;
randomsensing_matrix=randn(m,n);
%Basis_matrix=dftmtx(n)


y=randomsensing_matrix*x;%sensed signal m*1 dimension
Theta = randomsensing_matrix*Basis_matrix;

%we know y=theta*s;
%we need s now;
s2=Theta\y;

%using l1 minimization to get a sparse solution
%error is "error in actual y vs y obtained by l1 minimization of s"
%s1=(Theta,y,error);
s1 = l1eq_pd(s2,Theta,[],y,1e-5)
%x=Basis_matrix*s we already know
x1=Basis_matrix*s1;
size(x1)

%making x from linear into an image
Z=reshape(x1,size(C))
size(Z)
Recoverd_Image_using_FT_asbasis=Z;


figure;
subplot(2,2,1);
imshow(abs(C));
title('original image');
subplot(2,2,2);
imshow(abs(x1));





