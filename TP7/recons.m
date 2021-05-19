function [img,imbis] = recons(image,max)
    se = strel(ones(max));
    imbis = imopen(image,se);
    imbis = imreconstruct(imbis,image)
    img = image - imbis;
end