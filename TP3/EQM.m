function eqm = EQM(img1,img2)
tailleImage=size(img1);
eqm=0;
for i=1:tailleImage(1) %ligne de l'image
    for j=1:tailleImage(2) %colonne de l'image
        eqm=eqm+(img2(i,j,1)-img1(i,j,1))^2;
    end
end
eqm=eqm/(tailleImage(1)*tailleImage(2));

end