function resultat=newLut(N,liste1,lut)
resultat=zeros(N,3);
[sorti,Index]=sort(liste1);
ind=Index(end-N+1:end);
for i=1:N
    resultat(i,1)=lut(ind(i),1);
    resultat(i,2)=lut(ind(i),2);
    resultat(i,3)=lut(ind(i),3);
end
end