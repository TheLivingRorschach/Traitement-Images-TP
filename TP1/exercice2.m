clear all
close all
clc
%Ensuite on quantifie l'image avec cette lut
%Ensuite on calcule l'histogramme et on prend les N couleurs les plus
%présentes avec N = 8 et 32
%Ces N couleurs formeront notre nouvelle Lut et ensuite on quantifie les
%images avec cette nouvelle lut

%Exercice 2
%%
%Question 1 
%On calcule une lut avec un nombre très important de couleurs exemple :
%2^10
L=LutSubSamp(2^10);
%%
%On charge les trois images
img1=double(imread('TP01I01.bmp'));
img2=double(imread('TP01I02.jpg'));
img3=double(imread('TP01I03.jpg'));
%Ensuite on quantifie les images avec cette lut
[resultat1,eqm1,liste1]=quantification2(L,img1);
[resultat2,eqm2,liste2]=quantification2(L,img2);
[resultat3,eqm3,liste3]=quantification2(L,img3);
%%
%on les affiche
figure(1);
subplot(2,3,1);
image(uint8(resultat1));
title('Image_1 1024 couleurs');
subplot(2,3,2);
image(uint8(resultat2));
title('Image_2 1024 couleurs');
subplot(2,3,3);
image(uint8(resultat3));
title('Image_3 1024 couleurs');
%%
%Ensuite on calcule l'histogramme et on prend les N couleurs les plus
%présentes avec N = 8 et 32
hist1=imhist(uint8(resultat1));

hist2=imhist(uint8(resultat2));

hist3=imhist(uint8(resultat3));
%affichage des histogrammes
subplot(2,3,4);
bar(hist1);
title('Histogramme 1');
subplot(2,3,5);
bar(hist2);
title('Histogramme 2');
subplot(2,3,6);
bar(hist3);
title('Histogramme 3');
%%
N=32;
res1=newLut(N,liste1,L);
res2=newLut(N,liste2,L);
res3=newLut(N,liste3,L);
[newimage1,eqm21]=quantification(res1,img1);
[newimage2,eqm22]=quantification(res2,img2);
[newimage3,eqm23]=quantification(res3,img3);
figure(2);
subplot(1,3,1);
image(uint8(newimage1));
title('Image 1 quantifiée avec LUT 32 couleurs');
subplot(1,3,2);
image(uint8(newimage2));
title('Image 2 quantifiée avec LUT 32 couleurs');
subplot(1,3,3);
image(uint8(newimage3));
title('Image 3 quantifiée avec LUT 32 couleurs');

eqm21
eqm22
eqm23