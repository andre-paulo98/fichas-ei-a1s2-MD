clc
clear

A = [1 2 3 4], B = [3 4 5 6 7], C = [1 5 9 10];

U = union(union(A, B), C)
disp("1 a) A u B u C:");
disp(U);

disp("1 b) cardinalidade de U: ")
disp(length(U))

disp("1 c) complementar de Ã:")
disp(setdiff(U, A))

disp("1 d) a diferença de A e B, A - B")
disp(setdiff(A, B))

disp("1 e) diferença simétrica de A e B")
ds = setdiff(union(A, B), intersect(A, B))
disp (ds);

// 3.
function Y = simdiff(A, B)
    Y = setdiff(union(A, B), intersect(A, B))
endfunction

disp (simdiff(A, B))


// 6
cartoes = 1 : 410
pares = 2 : 2 : 410
multiplos7 = 7 : 7 : 410


disp("6 a) Quantidade de cartões pares que não multiplos de 7")
disp (length(setdiff(intersect(cartoes, pares), multiplos7)))

quadradoPerfeito = 1 : 20
quadradoPerfeito = quadradoPerfeito .^2

disp("6 b) cartões com o quadrado perfeito:")
disp(quadradoPerfeito)

disp("6 c) cartões multiplo 3 mas não quadrado perfeito")
multiplos3 = 3 : 3 : 410
c = setdiff(multiplos3, quadradoPerfeito)
disp(c)

disp("7.")
B = [1 2 3 4]
P = list([1], [2], [3, 4])


/*
Pi intersect Pj != 0
for i = 1 : length(P) - 1
    
    for j = i + 1 : length(P) - 1
        
        if(intersect(P(i), P(j)) != [])
    end
    
end


UNIAO DE TODOS OS ELEMENTOS DE Pi = B

uniao = []
for i = 1 : length(p)
    uniao = union(uniao, P(i))
end


//is equal, unique
if(uniao == B)

