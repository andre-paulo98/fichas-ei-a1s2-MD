
function isBT(arvore)

[u,v]=size(arvore)
lista=list()

ordem=[9 4 10 2 8 5 11 1 12 7 13 3 14 6 15]

for i=1:v 
    if arvore(ordem(i))<>0 
        lista($)=arvore(ordem(i))
    end
end

j=1
arv_b=%t
while arv_b==%t & j<length(lista)
    if lista(j)>lista(j+1) then
        j=j+1
    else
        arv_b=%f 
    end
end

if arv_b==%t then
    disp("A árvore é uma árvore binária de busca")
else
    disp("A árvore não é uma árvore binária de busca")
end

endfunction
