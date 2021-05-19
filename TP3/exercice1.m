clear all
close all
clc

%On affiche l'image de base et l'image bruitée

figure(1);
subplot(1,3,1);
img=double(imread('TP03I01.jpg'));
image(uint8(img));
colormap(gray(256));
title('Image origine');
subplot(1,3,2);
imgbruitee=bruiter(img,500);
image(uint8(imgbruitee));
colormap(gray(256));
title('Image bruitée');

%Filtre median
subplot(1,3,3);
imgfiltreemed=filtremedian(imgbruitee);
image(uint8(imgfiltreemed));
colormap(gray(256));
title('Image bruitée avec filtre médian');
%%
%EQM
eqmBruit = EQM(img,imgbruitee)
eqmfiltree = EQM(img,imgfiltreemed)

%%
tableau=zeros(2,20);
for N=1000:1000:20000
    imgbruitee=bruiter(img,N);
    eqmBruit = EQM(img,imgbruitee);
    imgfiltreemed=filtremedian(imgbruitee);
    eqmfiltree = EQM(img,imgfiltreemed);
    tableau(1,N/1000)=eqmBruit;
    tableau(2,N/1000)=eqmfiltree;
end
%%
figure(3)
plot([1:20],tableau(1,:),'r');
hold on;
plot([1:20],tableau(2,:),'b');

legend('EQMBruit','EQMFiltre');

%%
%Code discord
figure(4);
%Masque flou
clear all;
%I1= double(imread('TP03I02.jpg'));
I1=double(imread('TP03I02.jpg'));
%
I1R=I1(:,:);
I1G=I1(:,:);
I1B=I1(:,:);
coef=100;
%floutage
filtrePB=ones(3)*(1/9);
I2R=zeros(400,599);
I2G=zeros(400,599);
I2B=zeros(400,599);
I3R=zeros(400,599);
I3G=zeros(400,599);
I3B=zeros(400,599);
I4R=zeros(400,599);
I4G=zeros(400,599);
I4B=zeros(400,599);
I5R=zeros(400,599);
I5G=zeros(400,599);
I5B=zeros(400,599);
I2R=conv2(I1R,filtrePB,'same');
I2G=conv2(I1G,filtrePB,'same');
I2B=conv2(I1B,filtrePB,'same');
figure(12);
image(uint8(I2B));
colormap(gray(256));
for i=1:400
    for j=1:599
        I3R(i,j)=I1R(i,j)-I2R(i,j);
        I3G(i,j)=I1G(i,j)-I2G(i,j);
        I3B(i,j)=I1B(i,j)-I2B(i,j);
    end
end
figure(13);
image(uint8(I3B));
colormap(gray(256));
I4R=I3R*coef;
I4G=I3G*coef;
I4B=I3B*coef;
figure(14);
image(uint8(I4R));
colormap(gray(256));
%verifier pixels entre 0 et 255
for i=1:400
    for j=1:599
        I5R(i,j)=I1R(i,j)+I4R(i,j);
        I5G(i,j)=I1G(i,j)+I4G(i,j);
        I5B(i,j)=I1B(i,j)+I4B(i,j);
    end
end
for i=1:400
    for j=1:599
        if I5R(i,j)<0
            I5R(i,j)=0;
        end
        if I5R(i,j)>255
            I5R(i,j)=255;
        end
        if I5G(i,j)<0
            I5G(i,j)=0;
        end
        if I5G(i,j)>255
            I5G(i,j)=255;
        end
        if I5B(i,j)<0
            I5B(i,j)=0;
        end
        if I5B(i,j)>255
            I5B(i,j)=255;
        end
    end
end
I5(:,:,1)=I5R;
I5(:,:,2)=I5G;
I5(:,:,3)=I5B;
figure(15);
image(uint8(I5));


