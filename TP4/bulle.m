function bulle(binaire,img)

modif = true;
while(modif == true)
    [contours,nbpoints,energie] = tortue(binaire,img);
    nrjtemp = energie;
    modif = false;
    for x=1:nbpoints
        point =[contours(x,1),contours(x,2)];
        %g d h b
        liste = [[point(1)-1,point(2)];[point(1)+1,point(2)];[point(1),point(2)+1];[point(1),point(2)-1]];
        for p=1:4
            point = liste(p,:);
            if(point(1)<=0 || point(1)>size(binaire,1) || point(2)<=0 || point(2)>size(binaire,2))
                continue;
            end
            if(binaire(point(1),point(2))==0)
                continue;
            end
            v=[binaire(point(1)-1,point(2)-1) binaire(point(1)-1,point(2)) binaire(point(1)-1,point(2)+1) binaire(point(1),point(2)+1) binaire(point(1)+1,point(2)+1) binaire(point(1)+1,point(2)) binaire(point(1)+1,point(2)-1) binaire(point(1),point(2)-1) binaire(point(1)-1,point(2)-1)];
            if(sum(xor(v(1:8),v(2:9))) == 2 && sum(v(1:8)==0) >= 3)
                binaire(point(1),point(2)) = 0
                [contours,nbpoints,energie] = tortue(binaire,img);
                if (energie > nrjtemp)
                    binaire(point(1),point(2)) = 1;
                else
                    nrjtemp = energie;
                    modif = true;
                end      
            end
        end

    end
end
%%
%v=[bulle(i-1,j-1) bulle(i-1,j) bulle(i-1,j+1) bulle(i,j+1) bulle(i+1,j+1) bulle(i+1,j) bulle(i+1,j-1) bulle(i,j-1) bulle(i-1,j-1)];
%res1=sum(xor(v(1:8),v(2:9))) == 2;
%res2=sum(v(1:8)==0) >= 3;


end