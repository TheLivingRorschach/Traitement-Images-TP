clc
clear all
close all
%%
%Débruitage
img=double(imread('BE07I01.jpg'));
imgbinaire = imbinarize(img,120);
figure(1)
h=hist(reshape(img,1,[]),[0:255]);
bar(h)
figure(2)
subplot(1,2,1);
imagesc(imgbinaire);
colormap(gray(256));
title('Image binaire');

%On fait une ouverture : erosion (pour enlever le bruit) et ensuite
%dilatation

se = strel('disk',5);
%structurant disque de taille 5
imgouverte = imopen(imgbinaire,se);
subplot(1,2,2);
imagesc(imgouverte);
colormap(gray(256));
title('Image après ouverture');

%%
%Identification des classes
NCC1 = bweuler(imgbinaire);
t=1;
N=[];

while(NCC1>0)
    se1=strel(ones(t));
    E=imerode(imgbinaire,se1);
    I=imreconstruct(E,imgbinaire);
    NCC2 = bweuler(I);
    t=t+1;
    Ncc=NCC1-NCC2;
    N=[N Ncc];
    NCC1=NCC2;
end

figure(4);
bar(N);

%%
[max,indice]=findpeaks(N);

figure(5)
subplot(1,5,1);
%Classe 1 : 0 à 5
[im,imbis] = recons(imgbinaire,5);
imagesc(im);
colormap(gray(256));
%Classe 2 : 5 à 14
subplot(1,5,2);
[im,imbis] = recons(imbis,14);
imagesc(im);
colormap(gray(256));
%Classe 3 : 15 à 18
subplot(1,5,3);
[im,imbis] = recons(imbis,18);
imagesc(im);
colormap(gray(256));
%Classe 4 : 19 à 21
subplot(1,5,4);
[im,imbis] = recons(imbis,21);
imagesc(im);
colormap(gray(256));
%Classe 5 : 22 à 26
subplot(1,5,5);
[im,imbis] = recons(imbis,26);
imagesc(im);
colormap(gray(256));