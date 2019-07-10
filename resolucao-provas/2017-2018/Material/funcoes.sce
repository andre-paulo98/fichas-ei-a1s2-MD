
// reflexiva
function x=verifica1(M)
    [a b]=size(M)
    x=%t
    for i=1:a
        if M(i,i)==0 
            x=%f
        end
    end
endfunction


// antisimetrica
function x=verifica2(M)
    x=%t
    [a b]=size(M)
    for i=1:a
        for j=1:b
            if i<>j & M(i,j)==1 & M(j,i)==1
                x=%f
            end
        end
    end
endfunction

// transitiva
function x=verifica3(M)
    [a b]=size(M)
    A=zeros(a,b);
    for i=1:a
        A=A+M^i;
    end
    A=bool2s(A)
    if isequal(M,A)
        x=%t 
    else
        x=%f 
    end
endfunction


// simetrica
function x=verifica4(M)
    if isequal(M,M')
        x=%t
    else
        x=%f
    end
endfunction

