function [resultat,eqm] = ditheringSF(img,L)
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
erreurdsf=[0 0 0];

tailleImage=size(img);
tailleL=size(L);
index=0;
for i=1:tailleImage(1) %ligne de l'image
    for j=1:tailleImage(2) %colonne de l'image
        erreur=inf;
        for k=1:tailleL(1) %pour chaque ligne de la LUT
        e=(resultat(i,j,1)-L(k,1))^2+(resultat(i,j,2)-L(k,2))^2+(resultat(i,j,3)-L(k,3))^2; %calcul de l'erreur quadratique pour un pixel
        if e<erreur
            erreur=e; %Si l'erreur calculé est inférieur à la précedent elle devient la nouvelle
            index=k;
        end
        end
        eqm=eqm+erreur;
        %algorithme de dithering SF du cours 
        erreurdsf =[(resultat(i,j,1)-L(index,1)) (resultat(i,j,2)-L(index,2)) (resultat(i,j,3)-L(index,3))]; %erreur=Q(x,y)-C
        %Q(x,y)=C
        resultat(i,j,1)=L(index,1); 
        resultat(i,j,2)=L(index,2);
        resultat(i,j,3)=L(index,3); 
        %Q(x,y+1)=Q(x,y+1)+erreur*7/16
        if (j+1)<tailleImage(2)
            resultat(i,j+1,1)=resultat(i,j+1,1)+erreurdsf(1)*7/16;
            resultat(i,j+1,2)=resultat(i,j+1,2)+erreurdsf(2)*7/16;
            resultat(i,j+1,3)=resultat(i,j+1,3)+erreurdsf(3)*7/16;
        end
        %Q(x+1,y-1)=Q(x+1,y-1)+erreur*3/16
        if (i+1)<tailleImage(1) && (j-1)>0
            resultat(i+1,j-1,1)=resultat(i+1,j-1,1)+erreurdsf(1)*3/16;
            resultat(i+1,j-1,2)=resultat(i+1,j-1,2)+erreurdsf(2)*3/16;
            resultat(i+1,j-1,3)=resultat(i+1,j-1,3)+erreurdsf(3)*3/16;
        end
        %Q(x+1,y)=Q(x+1,y)+erreur*5/16
        if (i+1)< tailleImage(1)
            resultat(i+1,j,1)=resultat(i+1,j,1)+erreurdsf(1)*5/16;
            resultat(i+1,j,2)=resultat(i+1,j,2)+erreurdsf(2)*5/16;
            resultat(i+1,j,3)=resultat(i+1,j,3)+erreurdsf(3)*5/16;
        end
        %Q(x+1,y+1)=Q(x+1,y+1)+erreur*1/16
        if (i+1)< tailleImage(1) && (j+1)<tailleImage(2)
            resultat(i+1,j+1,1)=resultat(i+1,j+1,1)+erreurdsf(1)*1/16;
            resultat(i+1,j+1,2)=resultat(i+1,j+1,2)+erreurdsf(2)*1/16;
            resultat(i+1,j+1,3)=resultat(i+1,j+1,3)+erreurdsf(3)*1/16;
        end
    end
end
eqm=eqm/(tailleImage(1)*tailleImage(2)*3);
end