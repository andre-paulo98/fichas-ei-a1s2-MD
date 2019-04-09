clc
clear
// ficha 5


R = [1 0 1 0; 1 0 1 0; 1 1 0 0; 0 0 0 1]
disp("1) a) A matriz R:")
disp(R)

disp("1) b) A matriz inversa:")
disp(R')

function S=Um(M)
    [L, C] = size(M)
    for i = 1:L
        for j = 1:C
            
            if(M(i,j) > 1)
                M(i,j) = 1
            end
            
            
        end
        
    end
    S = M
endfunction

disp("1) c) A matriz R^2")
disp(Um(R*R))

disp("1) c) A matriz R^3")
disp(Um(R^3))

// A matriz R:
//   1.   0.   1.   0.
//   1.   0.   1.   0.
//   1.   1.   0.   0.
//   0.   0.   0.   1.

// não é reflexiva pois por exemplo falta o (2,2)
// não é simétrica pois existe o 2R1, mas não existe o 1R2
// não é antissimétrica pois existe o 3R1 e 1R3 mas 1 != 3
// não é transitiva pois existe 1R3 e 3R2 mas não existe 1R2


// e)
// fecho reflexivo 
disp("1) e) i)")
MR = Um(R + eye(4,4))
disp(MR)

// fecho simétrico

disp("1) e) ii)")
MS = Um(R + R')
disp(MS)
// R + (2,1)

// fecho transitivo

disp("1) e) iii)")
MT = Um(R + R^2 + R^3 + R^4)
disp(MT)
// R + (1,2)

disp("1) f) relação de equivalência")
disp(Um(R + MR + MS + MT))




function R=is_reflexiva(M)
    R = %T
    [L, C] = size(M)
    for i = 1:L
        if(M(i,i) <= 0)
            R = %F
        end
    end
endfunction



function R=is_simetrica(M)
    R = isequal(M, M')
endfunction











