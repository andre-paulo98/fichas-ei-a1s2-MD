clc
clear
exec('tree_plot.sce',-1)

function ordenacao=em_ordem(Arvore)
    
n=length(Arvore)

Arvore(n+1:2^ceil(log2(n))-1)=0

n=length(Arvore)

ordenacao=zeros(1,n)

potencia=floor(log2(n))
passo=2^potencia

k=1
while k<n & passo>=1
    for i=passo:passo:n
        if ordenacao(1,i)==0 then
            ordenacao(1,i)=k
            k=k+1
        end
    end
    passo=passo/2
end

endfunction


function isBusca(Arvore)
    
    ordem = em_ordem(Arvore)
    
    EBusca = %T
    
    for i=1:length(Arvore)-1
        if Arvore(i) > Arvore(i+1)
            printf('Falhou no indice %d, o valor %d é maior que %d\n', i, Arvore(i), Arvore(i+1))
            EBusca = %F
        end
        
        
    end
    
    
    disp(EBusca)
    
    
    
    
    
endfunction

//Exemplo:
//Arvore=[60 55 65 22 56 62 71 3 23 0 58]
Arvore=[60 55 65 22 0 0 0 56 0 62 71 3 23 0 58]
tree_plot(Arvore)

isBusca(Arvore)

