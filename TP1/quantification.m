function [resultat,eqm] = quantification(L,img)
if size(img,3)==1
    S=size(img);
    img2=zeros(S(1),S(2),3);
    img2(:,:,1)=img(:,:);
    img2(:,:,2)=img(:,:);
    img2(:,:,3)=img(:,:);
    img=img2;
end
resultat=img;
eqm=0;

tailleImage=size(img);
tailleL=size(L);
index=0;
for i=1:tailleImage(1) %ligne de l'image
    for j=1:tailleImage(2) %colonne de l'image
        erreur=inf;
        for k=1:tailleL(1) %pour chaque ligne de la LUT
        e=(img(i,j,1)-L(k,1))^2+(img(i,j,2)-L(k,2))^2+(img(i,j,3)-L(k,3))^2; %calcul de l'erreur quadratique pour un pixel
        if e<erreur
            erreur=e; %Si l'erreur calculé est inférieur à la précedent elle devient la nouvelle
            index=k;
        end
        end
        eqm=eqm+erreur;
        resultat(i,j,1)=L(index,1);
        resultat(i,j,2)=L(index,2);
        resultat(i,j,3)=L(index,3);
    end
end
eqm=eqm/(tailleImage(1)*tailleImage(2)*3);
end
