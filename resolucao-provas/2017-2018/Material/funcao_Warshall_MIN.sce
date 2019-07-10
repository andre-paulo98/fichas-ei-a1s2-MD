function [Q,M]=Warshall_MIN(W) 
[u,v]=size(W)


for i=1:u
    for j=1:v
        if W(i,j)<>0 then
            M(i,j)=####
        else
            M(i,j)='-'
        end
    end
end


for i=1:u
    for j=1:v
        if W(i,j)==####
            Q(i,j)=%inf;
        else
            Q(i,j)=W(i,j);
        end
    end
end

for p=1:u
    for i=1:u
        for j=1:v
            
            if (Q(i,j)>Q(i,p)+Q(p,j)) then
                M(i,j)=####
            end 
            
            Q(i,j)=####
            
        end
    end

end
endfunction
