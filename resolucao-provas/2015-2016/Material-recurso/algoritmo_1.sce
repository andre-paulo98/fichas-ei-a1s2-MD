//complete o algoritmo de Warshall, inserindo código na linha assinalada com ####: 
function P=warshall(A)
    P=A;
    [L C]=size(A)

    for k=1:L
        for i=1:L
            for j=1:L
                if P(i,j)==0
                    ####
                end
            end
        end
    end
endfunction


