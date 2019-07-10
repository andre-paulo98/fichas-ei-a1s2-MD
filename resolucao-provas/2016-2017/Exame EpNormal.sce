clc
clear

// 1.a)

A = []
B = [-12 -10 -5 0 15 23 57]

for i = -20:60
    
    r = ceil(sin(i/3))
    if r == 0
        A(1, $+1) = i
    end
    
end

disp(A)

// 1.b) 

C = setdiff(union(A,B), intersect(A,B))
disp("A cardinalidade do C: " + string(length(C)))



// 2

// 2.a)
function x=F(n)
    x=%e^(-0.1*n)*sin(((2*n+1) * %pi)/2)
endfunction

for i = 1:100
    //plot(i, F(i), "r.")
end

// 2.b)

diff = 1
n = 0
while diff > 10^-5
    n = n+1
    diff = abs(F(n))
end

disp("2.b) " + string(n))


// 3

R = readxls("Material/dados.xls")(1).value

function r = Antissimetrica(M)
    [l c] = size(M)
    
    r = %t
    
    for i = 1:l
        for j = 1:c
            
            if i <> j && M(i,j) == 1 && M(j,i) == 1
                disp("Falha no " + string(i) + "," + string(j))
                r=%f
            end
            
            
        end
        
    end
endfunction



disp("3. A relação R é antissimétrica? " + string(Antissimetrica(R     )))



// 4
disp("4.")
mPesos = readxls("Material/dados.xls")(2).value
AdG = bool2s(mPesos)




function I = GraphConnect(A)
    [L C] = size(A)
    I = 3
    
    caminhos = zeros(L, C)
    
    for i = 1:L
        caminhos = caminhos + A ^ i
    end
    
    caminhos = bool2s(caminhos)
    // fortemente conexo
    for i = 1:L
        for j = 1:C
            if caminhos(i,j) == 0
                I = 2
                break
            end
        end
    end
    
    // unilateralmente conexo
    if I == 2
        
        caminhos = bool2s(caminhos + caminhos')
        
        for i = 1:L
            for j = 1:C
                if(caminhos(i,j) == 0)
                    I = 1
                    break
                end
            end
        end
        
    end
    
    
    // fracamente conexo
    if I == 1
        
        
        Bm = zeros(L, C)
        for i = 1:L
            
            Bm = Bm + (A + A')^i
            
        end
        
        Bm = bool2s(Bm)
        
        
        for i = 1:L
            for j = 1:C
                if(Bm(i,j) == 0)
                    I = 0
                end
            end
        end
        
    end
    
    disp(Bm)
    
    
endfunction


GraphConnect(AdG)







