clear
clc

//   1 2 3 4 5 6 7 8
A = [0 0 0 0 0 1 0 0; // 1
     0 0 0 0 1 1 0 0; // 2
     0 0 0 1 0 0 1 0; // 3
     0 0 0 0 0 0 0 1; // 4
     0 0 1 0 0 0 0 0; // 5
     0 0 0 0 0 0 1 0; // 6
     0 1 0 1 0 0 0 0; // 7
     0 0 0 0 0 0 1 0] // 8

//   X Y T S
B = [0 0 0 1; // X
     1 0 1 1; // Y
     0 1 0 1; // T
     1 0 1 0] // S


//   R S T U
C = [1 1 0 0; // R
     1 0 0 1; // S
     0 1 0 0; // T
     1 0 1 0] // U

     


function P = warshall(A)
    L = size(A,1)
    P=A
    for k = 1:L
        for i = 1:L
            for j = 1:L
                P(i,j) = P(i,j) | (P(i,k) & P(k,j))
            end
        end
    end
endfunction
