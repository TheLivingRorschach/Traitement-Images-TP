function resultat = filtremedian(img)
%on filtre une image à l'aide d'un filtre 5x5
resultat=img;
tailleImage=size(img);

for i=3:tailleImage(1)-2 %ligne de l'image
    for j=3:tailleImage(2)-2 %colonne de l'image
        vect=sort(reshape(img(i-2:i+2,j-2:j+2),[],1));
        resultat(i,j)=vect(13);
    end
end
end