clear all
close all
clc

%On charge les trois images
img1=double(imread('TP02I01.jpg'));
img2=double(imread('TP02I02.bmp'));
img3=double(imread('TP02I03.bmp'));

%image(uint8(img1));
%colormap(gray(256));

%Calcul des histogrammes
hist1=imhist(uint8(img1));
hist2=imhist(uint8(img2));
hist3=imhist(uint8(img3));
%affichage des histogrammes
figure(1)
bar(hist1);
figure(2)
bar(hist2);
figure(3)
bar(hist3);
%%

%expansion de la dynamique des trois images
exp1=expansion(img1,hist1,255);
exp2=expansion(img2,hist2,255);
exp3=expansion(img3,hist3,255);
%affichage des images après traitement
figure(5)
subplot(131);
image(uint8(exp1));
colormap(gray(256));
subplot(132);
image(uint8(exp2));
colormap(gray(256));
subplot(133);
image(uint8(exp3));
colormap(gray(256));
%affichage des histogrammes des images traitées
figure(8)
subplot(131);
imhist(uint8(exp1));
subplot(132);
imhist(uint8(exp2));
subplot(133);
imhist(uint8(exp3));

%question 3
%histeq permet d'égaliser une image
imgeq1=double(histeq(uint8(img1)));
image(uint8(imgeq1));
colormap(gray(256));
imhist(uint8(imgeq1))

%%
%Egalisation

%%
%II-1 Table de couleur
figure(1);
image(uint8(img1));
colormap(gray(256));
%%
figure(2);
image(uint8(img1));
transfert(double([0:255]'));

%%
%II-2
palette=uint8((double([0:255]')./155).*255);
figure(1);
image(img1);
figure(2);
transfert(palette);
image(uint8(img1));