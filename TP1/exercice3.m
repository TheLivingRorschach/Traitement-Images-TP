%Les images ont été lues dans l'exercice 2 
%img1, img2, img3
tic;
[test1,eqmtest1]=ditheringSF(img1,res1);
t1=toc;
tic;
[test2,eqmtest2]=ditheringSF(img2,res2);
t2=toc;
tic;
[test3,eqmtest3]=ditheringSF(img3,res3);
t3=toc;

figure(3);
%affichage des images de base
subplot(3,3,1);
image(uint8(img1));
title('Image 1 de base');
%eqm=EQM(img1,test1)
subplot(3,3,2);
image(uint8(img2));
title('Image 2 de base');
%eqm=EQM(img2,test2)
subplot(3,3,3);
image(uint8(img3));
title('Image 3 de base');
%eqm=EQM(img3,test3)

%affichage des images quantifiées à l'exo 2 avec 2^15 puis 8 couleurs
subplot(3,3,4);
image(uint8(newimage1));
title('Image 1 après quantification par popularité 32 couleurs');
subplot(3,3,5);
image(uint8(newimage2));
title('Image 2 après quantification par popularité 32 couleurs');
subplot(3,3,6);
image(uint8(newimage3));
title('Image 3 après quantification par popularité 32 couleurs');

%affichage des images quantifiées avec dethering
subplot(3,3,7);
image(uint8(test1));
title('Image 1 avec dithering SF');
subplot(3,3,8);
image(uint8(test2));
title('Image 2 avec dithering SF');
subplot(3,3,9);
image(uint8(test3));
title('Image 3 avec dithering SF');
%%
eqmtest1
eqmtest2
eqmtest3
%%
t1
t2
t3