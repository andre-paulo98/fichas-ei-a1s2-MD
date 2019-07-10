function [Q,M]=Warshall_MIN(W) 
[u,v]=size(W)
for i=1:u
    for j=1:v
        if W(i,j)<>0 then
            M(i,j)=#####
        else
            M(i,j)='-'
        end
    end
end

disp(M)

for i=1:u
    for j=1:v
        if W(i,j)==##### then
            W(i,j)=%inf
        end
    end
end

Q=W

for k=1:u
    for i=1:u
        for j=1:v
            if Q(i,j)>##### then
               M(i,j)=M(i,k)+part(M(k,j),2:length(M(k,j)))
            end  
            Q(i,j)=#####
            
        end
    end
    disp(Q,"Q"+string(k)+"=");
    disp(M,"M"+string(k)+"=");
end

endfunction

