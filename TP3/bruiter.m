function img1 =bruiter(img,N)
tailleImage=size(img);
img1=img;
for i=1:N
    pixelAleaX = round(rand*(tailleImage(1)-1))+1;
    pixelAleaY = round(rand*(tailleImage(2)-1))+1;
    img1(pixelAleaX,pixelAleaY)=255;
    
    pixelAleaX = round(rand*(tailleImage(1)-1))+1;
    pixelAleaY = round(rand*(tailleImage(2)-1))+1;
    img1(pixelAleaX,pixelAleaY)=0;
end
