clc
clear all
close all
%Img couleur -> Img gris -> gradient -> LPE -> fusion
%Img couleur
img=double(imread('TP05I01.bmp'));
imggris=rgb2gray(uint8(img));
%Img gris
figure(1);
subplot(1,2,1);
image(uint8(imggris));
colormap(gray(256));
title('Image en niveaux de gris');
%gradient
Gx=conv2(imggris,[-1 -1 -1;0 0 0; 1 1 1],'same');
Gy=conv2(imggris,[-1 0 1; -1 0 1; -1 0 1],'same');
Gradient = abs(Gx)+abs(Gy);
subplot(1,2,2);
image(uint8(Gradient));
colormap(gray(256));
title('Image avec estimateur de gradient');
%LPE
figure(2);
[g,nb]=LPE(Gradient);
image(mod(g,256));
colormap(colorcube(256));
%%
%Fusion de régions
s = size(g);
for i = 2:s(1)-1
    for j =2:s(2)-3
        
        if ((g(i,j)~=0)&&(g(i,j+2)~=0)&&(g(i,j)~=g(i,j+2)))
            moy1 = 0;
            n1 = 0;
            moy2 = 0;
            n2 = 0;
            for k = 2:s(1)-1
                for l =2:s(2)-1
                    if(g(k,l)==g(i,j))
                        n1 = n1+1;
                        moy1 = moy1 + imggris(k-1,l-1);
                    end
                    if(g(k,l)==g(i,j+2))
                        n2 = n2+1;
                        moy2 = moy2 + imggris(k-1,l-1);
                    end
                    
                end
            end
            moy1 = moy1/n1;
            moy2 = moy2/n2;
            final = abs(moy1-moy2);
            if(final<=1)
                
                lab = g(i,j+2);
                for k = 2:s(1)-1
                    for l =2:s(2)-1
                        if(g(k,l)==lab)
                            g(k,l)=g(i,j);
                        end

                    end
                end
            end
        end
    end
end
figure(23);
image(mod(g,256));
colormap(colorcube(256));
for j =2:s(2)-1
    for i = 2:s(1)-3
    
        
        if ((g(i,j)~=0)&&(g(i+2,j)~=0)&&(g(i,j)~=g(i+2,j)))
            moy1 = 0;
            n1 = 0;
            moy2 = 0;
            n2 = 0;
            for k = 2:s(1)-1
                for l =2:s(2)-1
                    if(g(k,l)==g(i,j))
                        n1 = n1+1;
                        moy1 = moy1 + imggris(k-1,l-1);
                    end
                    if(g(k,l)==g(i+2,j))
                        n2 = n2+1;
                        moy2 = moy2 + imggris(k-1,l-1);
                    end
                    
                end
            end
            moy1 = moy1/n1;
            moy2 = moy2/n2;
            final = abs(moy1-moy2);
            if(final<=1)
                
                lab = g(i+2,j);
                for k = 2:s(1)-1
                    for l =2:s(2)-1
                        if(g(k,l)==lab)
                            g(k,l)=g(i,j);
                        end

                    end
                end
            end
        end
    end
end
figure(24);
image(mod(g,256));
colormap(colorcube(256));