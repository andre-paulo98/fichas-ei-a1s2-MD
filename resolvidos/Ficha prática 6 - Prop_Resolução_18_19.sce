//Matemática Discreta - Proposta de resolução da ficha prática 6

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.

//Exercício 1
//a)

A=[0 1 0 0 1 0
   0 0 1 1 0 0
   1 0 0 0 1 0
   0 0 0 0 0 0
   0 0 0 0 0 1
   1 0 0 1 0 0]
   
//b)
grafo(A)
//não esquecer: compilar o código disponibilizado

//c)

//G é fortemente conexo?

function FC=forteconexo(A)
[u,v]=size(A)
FC=%t
S=zeros(u,v)
for i=1:u
    S=S+A^i
end
for i=1:u
    for j=1:v
        if S(i,j)==0 then
            FC=%f
        end
    end
end
if FC then
    disp("G é fortemente conexo")
else
    disp("G não é fortemente conexo")    
end
endfunction

forteconexo(A)

//O grafo não é fortemente conexo pois S=A^1+A^2+...+A^6 tem pelo menos um elemento nulo

//G é unilateralemente conexo?
function UC=unilateralconexo(A)
[u,v]=size(A)
UC=%t
S=zeros(u,u);
for i=1:u
    S=S+A^i;
end

T=S+S'
disp(T)
for i=1:u
    for j=1:v
        if i<>j & T(i,j)==0 then
            UC=%f
        end
    end
end

if UC then
    disp("G é unilateralmente conexo")
else
    disp("G não é unilateralmente conexo")    
end
endfunction

unilateralconexo(A)

//O grafo é unilateralmente conexo pois T=S+S' tem todos os elementos (fora da diagonal principal) não nulos

//G é fracamente conexo?
function frC=fracaconexo(A)
[u,v]=size(A)
frC=%t

V=zeros(u,u)
for i=1:u
    V=V+(A+A')^i
end

for i=1:u
    for j=1:v
        if V(i,j)==0 then
           frC=%f
        end
    end
end

if frC then
    disp("G é fracamente conexo")
else
    disp("G não é fracamente conexo")    
end
endfunction

fracaconexo(A)

////O grafo é fracamente conexo pois V=(A+A')+(A+A')^2+...+(A+A')^6 tem todos os elementos não nulos

//Exercício 2

//a) 
//i)

A=[0 0 0 0 0 1 0 0
   0 0 0 0 1 1 0 0
   0 0 0 1 0 0 1 0
   0 0 0 0 0 0 0 1
   0 0 1 0 0 0 0 0
   0 0 0 0 0 0 1 0
   0 1 0 1 0 0 0 0
   0 0 0 0 0 0 1 0]

//ii)

S=zeros(8,8)
for i=1:8
    S=S+A^i
end
disp(S)

//iii)

P=bool2s(S)

//b)

function conetividade(A)
    if forteconexo(A) then

    elseif unilateralconexo(A) then

    elseif fracaconexo(A) then

    else
        disp("O grafo é desconexo")
    end
endfunction

conetividade(A)

//O grafo não é fortemente conexo pois S=A^1+A^2+...+A^8 tem elementos nulos

//O grafo é unilateralmente conexo pois S+S' tem todos os elementos não nulos


//Exercício 3
     
function graus(A,v)
[a,b]=size(A)

grau_saida=0;
grau_entrada=0;

for i=1:a
    grau_saida=grau_saida+A(v,i)
    grau_entrada=grau_entrada+A(i,v)
end

disp("O vértice "+string(v)+" tem grau de saída igual a "+string(grau_saida)+" e grau de entrada igual a "+string(grau_entrada))

endfunction

//função com output "Gr":

function Gr=graus(A,v)
[a,b]=size(A)
grau_saida=0;
grau_entrada=0;

for i=1:a
    grau_saida=grau_saida+A(v,i)
    grau_entrada=grau_entrada+A(i,v)
end

disp("O vértice "+string(v)+" tem grau de saída igual a "+string(grau_saida)+" e grau de entrada igual a "+string(grau_entrada))

Gr=[grau_saida grau_entrada]
endfunction

//Exercício 4

function poco(A)
[a,b]=size(A)
v=0;
for i=1:a
grau_saida=0;
    for j=1:b
        grau_saida=grau_saida+A(i,j)
    end
    if grau_saida==0 then
        disp("O vértice "+string(i)+" é um poço.")
        v=v+1
    end
end
if v==0 then
    disp("O grafo não tem poços")
end
endfunction

//Resolução alternativa usando a funçção "graus" do exercício 3:

function poco(A)
[a b]=size(A)
p=[]
for i=1:a
   Gr=graus(A,i)  
      if Gr(1,1)==0 then
           p=union(p,i)
      end
end
    if isequal(p,[]) then
        disp("O grafo não tem poços.")
    else
        disp("O grafo tem o(s) seguinte(s) poço(s):")
        disp(p)
    end
endfunction

//Exercício 5

function caminho_compK(A,k,vi,vj)

T=A^k
numero=T(vi,vj)

disp("O número de caminhos de comprimento "+string(k)+" do vértice "+string(vi)+" para o vértice "+string(vj)+" é igual a: "+string(numero))
endfunction

//Exercício 6

//a)

A=[0 0 0 0 1 0 0
   0 0 1 1 0 0 0
   0 0 0 0 0 1 0
   0 1 0 0 0 0 1
   1 0 0 0 0 0 0
   0 1 0 0 0 0 0
   0 0 1 0 0 0 0]
   
  
//b)
//i) Não é possível apanhar um voo direto de Miami para Chicago porque na posição (6,3) da matriz de adjacência temos um 0
  
//ii) 

P=bool2s(A+A^2+A^3+A^4+A^5+A^6+A^7)

//Como na matriz dos caminhos P, na posição (2,1) temos um 0, concluímos que não é possível voar de Boston para Atlanta.

//iii) Sim, é possível voar de Miami para Chicago porque na matriz dos caminhos P, posição (6,3) temos um 1. 

A^2
//Fazendo um mínimo de 1 escala

//iv) 
A^3
//Sim, é possível voar de Denver para Miami fazendo duas escalas; é possível fazê-lo de 2 formas diferentes (Denver-> Reno-> Chicago-> Miami ou Denver-> Boston-> Chicago-> Miami)

//v)
bool2s(A+A^2+A^3+A^4)-bool2s(A+A^2+A^3)
//Sim, existe(m) pares origem -> destino que exijam uma viagem com o mínimo de 3 escalas: Chicago-> Reno e Reno->Denver.


