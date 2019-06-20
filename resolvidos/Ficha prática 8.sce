//Matemática Discreta - Proposta de resolução da ficha prática 8

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.


ficheiro=readxls('Grafo_f8.xls')
A=ficheiro(1).value

//Exercício 1

function L=blargura(A,vert)
[u,v]=size(A)

Identifica=list('A','B','C','D','E','F','J','K','L')

//identificamos o vértice inicial vert
for i=1:u
    if vert==Identifica(i)
        vi=i
    end
end

Estado=ones(1,u)   //iniciamos todos os vértices com estado 1

Fila=list(vi);//criamos lista "Fila" que, inicialmente, só contém o vértice inicial vi
Estado(vi)=2; //mudamos o estado do vértice inicial vi

Vvisitado=list();  //criamos a lista dos Vértices visitados 

while length(Fila)<>0 //enquanto a fila não ficar vazia 

Vvisitado($+1)=Fila(1)

Estado(Fila(1))=3; //passamos o 1.º elemento da fila ao estado 3 porque este já foi visitado (não o queremos "apanhar" novamente)

for j=1:u //percorremos a linha "Fila(1)" da matriz A para identificar os sucessores do vértice que está na 1.ª posição da Fila
      if A(Fila(1),j)==1 & Estado(j)==1 then
          Fila($+1)=j;
          Estado(j)=2;
      end
end

Fila(1)=null() //retiramos da fila o 1.º vértice (aquele que estivemos a tratar)

end

L=Identifica(Vvisitado(1))
for i=2:length(Vvisitado)
     L=L+" -> "+Identifica(Vvisitado(i))
end

endfunction

blargura(A,'A')

clear

ficheiro=readxls('Grafo_f8.xls')
A=ficheiro(1).value

//Exercício 2

function L=bprofundidade(A,vert)
[u,v]=size(A)

Identifica=list('A','B','C','D','E','F','J','K','L')

for i=1:u
    if vert==Identifica(i)
        vi=i
    end
end


Estado=ones(1,u)  //iniciamos todos os vértices com estado 1

Pilha=list(vi);  //criamos a lista "Pilha" que, inicialmente, só contém o vértice inicial vi
Estado(vi)=2;

Vvisitado=list();  //criamos a lista dos Vértices visitados 

while length(Pilha)<>0   //enquanto a pilha não ficar vazia 
Vvisitado($+1)=Pilha($)
Estado(Pilha($))=3;  //mudamos o estado para 3 porque já não o queremos "apanhar" novamente

aux=Pilha($); //guardar informação de quem estava em último na Pilha
Pilha($)=null() //retiramos o último elemento da Pilha

for j=1:u //percorrer a linha Pilha($) da matriz A para identificar os sucessores do vértice que está em último lugar na Pilha
      if A(aux,j)==1 then
          if Estado(j)==1 then //se j não está na pilha nem foi visitado
              Pilha($+1)=j;
              Estado(j)=2;
          elseif Estado(j)==2 then //se j já está na pilha
              for i=1:length(Pilha)
                  if Pilha(i)==j  //localiza...
                      Pilha(i)=null() //... elimina...
                      Pilha($+1)=j;   //... e volta a inserir
                  end
              end
          end
      end
end

end

//criação do caminho a seguir a partir de Vértices visitados
L=Identifica(Vvisitado(1));
for i=2:length(Vvisitado)
    L=L+' -> '+Identifica(Vvisitado(i))
end

endfunction

bprofundidade(A,'A')

