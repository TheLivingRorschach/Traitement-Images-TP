%%1-Gradient

img=double(zeros(50));
k=1;
for i=10:16
    k=k*2;
    img(i:50-i+1,i:50-i+1)=k;
end
for i=17:23
    k=k/2;
    img(i:50-i+1,i:50-i+1)=k;
end

figure(1)
image(uint8(img));
colormap(gray(256));

%%
%2-Adaptation de l'algorithme de la bulle
%2-1 Algorithme de la tortue
%Contour est un tableau contenant les coordonnées des points représentant
%les contours et nbPoints est le nombre de points formant le contour
%On test sur une image toute noire avec un bloc blanc au milieu pour voir
%le fonctionnement de la fonction tortue 

imgbinaire=double(ones(50));
for x=24:26
    for y=24:26
        imgbinaire(x,y)=0;
    end
end
%%
[contours,nbPoints] = tortue1(imgbinaire);

figure(1)
image(uint8(contours));
colormap(gray(256));
%%
%code complété
[contours,nbPoints,energie] = tortue(imgbinaire,img);

figure(1)
image(uint8(contours));
colormap(gray(256));
%%

%2-2 Algorithme de la bulle
bulle(imgbinaire,img);
figure(2)
image(uint8(contours));
colormap(gray(256));