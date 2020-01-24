clear, clc
A = imread('C:\Users\Lenovo\Desktop\apple-2.jpeg');
A=imresize(A,[60,60],'bicubic');
A=rgb2gray(A);
A = A([1:60],[1:60]);
x = double(A(:));
n = length(x);

m = 1500;
%Random Matrix
Random_SensingMatrix = randn(m,n);

%Compression ie random sensing
y = Random_SensingMatrix*x;

%
Basis_Matrix = (dct(eye(n)));

%Theta in y= Theta*s
Theta = Random_SensingMatrix*Basis_Matrix;

%___l2 NORM SOLUTION___ s2 = Theta\y;
s2 = pinv(Theta)*y;

%___BP SOLUTION___
%ToolBox Used
s1 = l1eq_pd(s2,Theta,Theta',y,5e-100,500); 

%Solutions Displayed
plot(abs(s2),'b'), hold
plot(abs(s1),'r.-')
legend('least squares','basis pursuit')
title('solution to y = \Theta s')

%Reconstruct using s2
x2 = Basis_Matrix*s2; 

%reconstruct using s1-sparse
x1=Basis_Matrix*s1;


figure('name','Compressive sensing image reconstructions')
subplot(1,3,1), imagesc(abs(reshape(x,60,60))), xlabel('original'), axis image
subplot(1,3,2), imagesc(abs(reshape(x2,60,60))), xlabel('least squares'), axis image
subplot(1,3,3), imagesc(abs(reshape(x1,60,60))), xlabel('basis pursuit'), axis image
colormap gray




