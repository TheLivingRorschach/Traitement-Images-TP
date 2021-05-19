clear all
close all
clc

%%Exercice 1
%Question 1
L=LutSubSamp(32)

%Question 2
%On charge les trois images
img1=double(imread('TP01I01.bmp'));
img2=double(imread('TP01I02.jpg'));
img3=double(imread('TP01I03.jpg'));

%on les quantifie
tic;
[resultat1,eqm1]=quantification(L,img1);
tempsTraitement1=toc;
tic;
[resultat2,eqm2]=quantification(L,img2);
tempsTraitement2=toc;
tic;
[resultat3,eqm3]=quantification(L,img3);
tempsTraitement3=toc;

%on les affiche
figure(1);
image(uint8(resultat1));
figure(2);
image(uint8(resultat2));
figure(3);
image(uint8(resultat3));

%Quesiton 3
eqm1
eqm2
eqm3
%si on calcule la racine de eqm on a un ordre d'idée de la variation entre
%un pixel de l'image quantifiée et de l'image de base

%Question 4
tempsTraitement1
tempsTraitement2
tempsTraitement3