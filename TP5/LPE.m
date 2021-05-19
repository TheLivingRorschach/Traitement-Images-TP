function [g,nb]=LPE(img)
g = ones(size(img,1)+2,size(img,2)+2);
lab=1;
for N=0:max(max(img))
    for px=2:size(img,1)+1
        for py=2:size(img,2)+1
            if img(px-1,py-1) == N
                 voisinage = [g(px-1,py-1) g(px-1,py) g(px-1,py+1) g(px,py+1) g(px+1,py+1) g(px+1,py) g(px+1,py-1) g(px,py-1)];
                 temp = 1;
                 unlab = false;
                 deuxlab = false;
                 for x=1:length(voisinage)
                    if (voisinage(x)>1 && unlab==false)
                        unlab = true;
                        temp = voisinage(x);
                    elseif(voisinage(x)>1 && unlab==true && voisinage(x)~=temp)
                        deuxlab=true;
                    end
                 end
                    if(unlab && ~deuxlab)
                        g(px,py)=temp;
                    elseif(deuxlab)
                        g(px,py)=0;
                    else
                        lab=lab+1;
                        g(px,py)=lab;
                    end
            end
        end
    end
    
end
nb=length(g);
end