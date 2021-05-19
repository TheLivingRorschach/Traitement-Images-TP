function resultat=expansion(img,histo,N)
%Renvoie un vecteur avec les indices de tous les élèments non nul d'un
%vecteur
k=find(histo);
Hmin=k(1)
Hmax=k(end)
tailleImage=size(img);
resultat=img;

for i=1:tailleImage(1) %ligne de l'image
    for j=1:tailleImage(2) %colonne de l'image
        resultat(i,j)=N*(img(i,j)-Hmin)/(Hmax-Hmin);
    end
end
end

