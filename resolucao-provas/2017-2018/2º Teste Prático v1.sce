clc
clear

// 1.a)

Re1R = readxls("Material/dados.xls")(1).value
exec("Material/funcoes.sce", -1)

disp ("Re1R")
disp(Re1R)

// 1. b)

// Equivalência => RST
//                 143

isR = verifica1(Re1R)
isS = verifica4(Re1R)
isT = verifica3(Re1R)

if isR == %t & isS == %t & isT == %t
    disp("A matrix Re1R é uma relação de equivalência")
else
    if isR == %f
        disp("A matriz não é uma relação de equivalência pois não é reflexiva")
    end
    if isS == %f
        disp("A matriz não é uma relação de equivalência pois não é simétrica")
    end
    if isT == %f
        disp("A matriz não é uma relação de equivalência pois não é transitiva")
    end
    
end


////////
// 2
////////

grafoOrientado = readxls("Material/dados.xls")(2).value
caminhos = bool2s(grafoOrientado)
a = caminhos^5

S = zeros(9,9)

for i=1:5
    S=S+caminhos^i
end

disp("2.a) Existem " + string(S(3,7)) + " caminhos de 3 para 7 com comprimento igual ou menor a 5")

// 2b

function Y=fonte(M,v)
//M: matriz de adjacências do grafo G
Y=%t;
[a b]=size(M)
soma=0
for i=1:b
   soma=soma + M(i,v)
end
if soma <> 0
   Y=%f
end
endfunction


// 2c


function [Q,M]=Warshall_MIN(W) 
[u,v]=size(W)


for i=1:u
    for j=1:v
        if W(i,j)<>0 then
            M(i,j)=string(i)+string(j)
        else
            M(i,j)='-'
        end
    end
end


for i=1:u
    for j=1:v
        if W(i,j)==0
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
                M(i,j)=M(i,p)+part(M(p,j), 2:length(M(p,j)))
            end 
            
            Q(i,j)=min(Q(i,j),Q(i,p)+Q(p,j))
            
        end
    end

end
endfunction

[a b] = Warshall_MIN(grafoOrientado)
disp("O caminho mais curto de 1 para 8 é: " + string(b(1,8)) + " e tem como peso: " + string(a(1,8)))



