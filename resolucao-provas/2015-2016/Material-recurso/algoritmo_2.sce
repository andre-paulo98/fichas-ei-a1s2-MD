function Z=Warshall_MIN(W) 
[u,v]=size(W)

for i=1:u
    for j=1:v
        if W(i,j)==0 then
            W(i,j)=%inf
        end
    end
end

Q=W

for k=1:u
    for i=1:u
        for j=1:v
            Q(i,j)=min(Q(i,j),Q(i,k)+Q(k,j))
        end
    end
    disp(Q,"Q"+string(k)+"=")

end
Z=Q
endfunction

Warshall_MIN(AdG)
