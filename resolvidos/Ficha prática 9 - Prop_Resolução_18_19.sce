//Matemática Discreta - Proposta de resolução da ficha prática 9

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.

//Exercício 1
//a)

Arvore=[60 55 65 22 56 62 71 3 23 0 58]
scf(1)
tree_plot(Arvore) // para visualizar a representação usual, a partir do código disponível no Moodle; não esquecer de correr o código da função tree_plot

//b)

[u,n]=size(Arvore)

//inserimos diretamente um vetor que permita obter a ordenação em-ordem (este vetor indica as sucessivas posições que devemos considerar para obter esta ordenação, a partir da representação sequêncial da árvore)

ordenacao=[8 4 9 2 10 5 11 1 12 6 13 3 14 7 15]

//ou executamos a função "em_ordem" fornecida pelos docentes no Moodle

ordenacao=em_ordem(Arvore)

//tendo por base o vetor "ordenacao", onde temos a ordenação em em-ordem, formamos a lista que contem os nós da árvore por essa ordem, tendo o cuidado de retirar os "zeros", caso existam

lista=list()
for i=1:n
    if Arvore(ordenacao(i))<>0
        lista($+1)=Arvore(ordenacao(i))
    end
end

//Sabemos que, se a árvore binária é de busca, a lista dos nós em em-ordem terá os seus elementos dispostos por ordem crescente. Assim, vamos verificar se os elementos da lista estão ordenados de forma crescente:

j=1
arv_busca=%t
while arv_busca==%t & j<size(lista)
    if lista(j)<lista(j+1) then
        j=j+1
    else
        arv_busca=%f 
    end
end

//ou

arv_busca=%t
for i=1:length(lista)-1
    if lista(i+1)<lista(i)
        arv_busca=%f
    end
end

if arv_busca==%t then
    disp("A árvore é uma árvore binária de busca")
else
    disp("A árvore não é uma árvore binária de busca")
end

//Exercício 2
//a)

Ficheiro=readxls('arvores.xls')

Arvore=Ficheiro(1).value
scf(2)
tree_plot(Arvore)

function L=insert_tree(Arvore,item)

[u,n]=size(Arvore);

i=1
encontramos=%f
while i<=n & Arvore(i)<>0 & encontramos==%f
      if Arvore(i)==item then
           disp("encontrámos")
           encontramos=%t
       else
           if Arvore(i)>item then
               i=2*i
           else
               i=2*i+1
           end
       end
end


if encontramos==%f then
        Arvore(i)=item;
 else
        disp("O item "+string(item)+" está na posição "+string(i)+" do vector ARVORE")
end
L=Arvore;
endfunction 

L=insert_tree(Arvore,45)

scf(3)
tree_plot(L)

//b)

Ficheiro=readxls('arvores.xls')
lista=Ficheiro(2).value

function Arv=const_tree(lista)

n=length(lista)
Arvore=zeros(1,n)
Arvore(1)=lista(1)

for i=2:n
    item=lista(i)
    Arvore=insert_tree(Arvore,item)
end
Arv=Arvore
endfunction 

Arv=const_tree(lista)
scf(4)
tree_plot(Arv)
