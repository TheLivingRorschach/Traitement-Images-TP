%1 estimation de gradient
img=imread('TP05I01.bmp');
img=rgb2gray(img);
%imshow(img);
%Prewitt
%code pour faire des gradients
grad1=conv2(img, [-1 -1 -1;0 0 0;1 1 1 ],'same');
grad2=conv2(img, [-1 0 1;-1 0 1;-1 0 1],'same');
gradient=abs(grad1)+abs(grad2);
imshow(gradient);

%2 ligne de partage des eaux
[tailleX,tailleY]=size(img);
label=ones(tailleX+1, tailleY+1);
ceLabel=2;
lab=1;
%Pour N allant de 0 à 255
for N=0:max(gradient)
    %Pour chaque pixel p tel que image(p)=N
    for x=2:tailleX-1
        for y=2:tailleY-1
            if gradient(x,y)==N
                [lab,nbVoisins]=nbVoisinsLabellises(label,x,y);
                %Si p n'as pas de voisin labellisé dans label
                if nbVoisins==0
                    %img(x,y)<2 & img(x-1,y+1)<2 & img(x,y+1)<2 & img(x+1,y+1)<2 & img(x-1,y)<2 &img(x+1,y)<2 & img(x-1,y-1)<2 & img(x,y-1)<2 & img(x+1,y-1)<2
                    %label(p)=nouveau label
                    ceLabel=ceLabel+1;
                    label(x,y)= ceLabel;
                 %sinon
                else
                    %si p a un seul label dans son voisinage sans label
                    if nbVoisins==1
                        %label(p)=ce label
                        label(x,y)=lab;
                    %sinon label(p)=Ligne partage eaux
                    else
                        label(x,y)=0;
                    end
                end
            end
        end
    end
end
%nnz(unique(label))
%26482 régions

%% 3 Fusion de regions
img=img(1:500,1:500);
label=label(1:500,1:500);
y=2;
for x=2:50-1
    pts1=[];
    pts3=[];
    p1=label(x-1,y);
    p2=label(x,y);
    p3=label(x+1,y);
   [a,b,pts1]=find((label==p1).*(double(img)+1));
   pts1=mean(pts1)-1;
   [a,b,pts3]=find((label==p3).*(double(img)+1));
   pts3=mean(pts3)-1;
    ecart=abs(pts1-pts3)
    if (p1~=0 & p3~=0) & (p1~=p3) & (p2==0) & (ecart<=20)%moyenne
        label(x,y)=p1;
        label(x+1,y)=p1;
    end
        for y=2:50-1
            p1=label(x,y-1);
            p2=label(x,y);
            p3=label(x,y+1);
           [a,b,pts1]=find((label==p1).*(double(img)+1));
           pts1=mean(pts1)-1;
           [a,b,pts3]=find((label==p3).*(double(img)+1));
           pts3=mean(pts3)-1;
            ecart=abs(pts1-pts3)
             if (p1~=0 & p3~=0) & (p1~=p3) & (p2==0) & (ecart<=20)%moyenne
                label(x,y)=p1;
                label(x,y+1)=p1;
             end
        end
end
figure(2);
image(mod(label,256));
colormap(colorcube(256));
