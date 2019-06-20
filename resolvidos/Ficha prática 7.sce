//Matemática Discreta - Proposta de resolução da ficha prática 7

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.


//Exercício 1

function P=Warshall(A)
[u,v]=size(A)
P=A
for k=1:u
    for i=1:u
        for j=1:v
            if P(i,j)==1 | (P(i,k)==1 & P(k,j)==1) then
                P(i,j)=1
            end           
        end
    end
    disp(P,"P"+string(k)+"=")
end
disp("A Matriz de Caminhos P é:")
endfunction

//outra forma com código simplificado:

function P=Warshall(A)
[u,v]=size(A)
P=A
for k=1:u
    for i=1:u
        for j=1:v
            P(i,j)= P(i,j)  | (P(i,k) & P(k,j))
        end
    end
end
disp("A Matriz de Caminhos P é:")
endfunction

//a)

A=[0 0 0 0 0 1 0 0
   0 0 0 0 1 1 0 0
   0 0 0 1 0 0 1 0
   0 0 0 0 0 0 0 1
   0 0 1 0 0 0 0 0
   0 0 0 0 0 0 1 0
   0 1 0 1 0 0 0 0
   0 0 0 0 0 0 1 0]

Warshall(A)

//b)
  
A=[1 1 0 0
   1 0 0 1
   0 1 0 0
   1 0 1 0]
   
Warshall(A);

//Exercício 2

function [Q,M]=Warshall_MIN(W) 
[u,v]=size(W)

//construção da matriz M0:

for i=1:u
    for j=1:v
        if W(i,j)<>0 then
            M(i,j)=string(i)+string(j)
        else
            M(i,j)='-'
        end
    end
end

//construção da matriz Q0:

for i=1:u
    for j=1:v
        if W(i,j)==0
            Q(i,j)=%inf;
        else
            Q(i,j)=W(i,j);
        end
    end
end

for k=1:u
    for i=1:u
        for j=1:v
            
            if (Q(i,j)>Q(i,k)+Q(k,j)) then
                M(i,j)=M(i,k)+part(M(k,j), 2:length(M(k,j)))
            end 
            
            Q(i,j)=min(Q(i,j),Q(i,k)+Q(k,j))
            
        end
    end
    disp(Q,"Q"+string(k)+"=")
    disp(M,"M"+string(k)+"=")

end
endfunction

//Para grafos com mais de 9 vértices:

function Warshall_MIN_9(W) 
[u,v]=size(W)

M=string(W)

for i=1:u
    for j=1:v
        if W(i,j)<>0 then
            M(i,j)=string(i)+string(j)
        else
            M(i,j)='-'
        end
    end
end

disp(M)

for i=1:u
    for j=1:v
        if W(i,j)==0 then
            W(i,j)=%inf
        end
    end
end

Q=W

for k=1:u
    for i=1:u
        for j=1:v
            if Q(i,j)>Q(i,k)+Q(k,j) then
               if k>9
                   M(i,j)=M(i,k)+part(M(k,j),3:length(M(k,j)))
               else
                   M(i,j)=M(i,k)+part(M(k,j),2:length(M(k,j)))
               end
            end  
            Q(i,j)=min(Q(i,j),Q(i,k)+Q(k,j))
            
        end
    end
    disp(Q,"Q"+string(k)+"=")
    disp(M,"M"+string(k)+"=")
end
endfunction

//Exercício 3

//a)

W=[0 0 3 0
   5 0 1 7
   2 0 0 4
   0 6 0 8]

Warshall_MIN(W)

//b)

W=[0 3 0 1 5 0 0 0 0 0 0
   0 0 4 0 1 0 0 0 0 0 0
   0 0 0 0 0 1 0 0 0 0 4
   0 0 0 0 4 0 3 2 0 0 0
   0 0 2 0 0 4 0 0 3 0 0
   0 0 0 0 0 0 0 0 1 0 2
   0 0 0 0 0 0 0 6 0 0 0
   0 0 0 0 1 0 0 0 4 0 0
   0 0 0 0 0 0 0 0 0 0 3
   4 0 0 6 0 0 2 0 0 0 0
   0 0 0 0 0 0 0 0 0 0 0]

//Warshall_MIN_9(W)


//Exercício 4

//a)
A=readxls('grafos_f7.xls') //o ficheiro deverá estar visível na janela lateral "File Browser"
B=A(1)
B=B.value

//b)

function viagem_custo(A,partida,chegada)
    
I=['Braga' 'Porto' 'Coimbra' 'FigFoz' 'Leiria' 'Santarém' 'Lisboa' 'Évora' 'Sines']
    
C=A(3).value

[Q,M]=Warshall_MIN(C)

q=Q(partida,chegada)
m=M(partida,chegada)

D=A(2)
D=D.value

lista=evstr(strsplit(m));

d=0;
P=' '
for i=1:length(m)-1
   d=d+D(lista(i),lista(i+1))
   P=P+I(1,lista(i))+" - "
end
P=P+I(1,lista(i+1))

disp("Para viajar entre "+string(I(1,partida))+" e "+string(I(1,chegada))+" com custo mínimo de "+string(q)+" euros, deverá fazer o percurso "+string(P)+", com duração de "+string(d)+" horas")
endfunction

viagem_custo(A,3,7)

c)

function viagem_duracao(A,partida,chegada)
    
I=['Braga' 'Porto' 'Coimbra' 'FigFoz' 'Leiria' 'Santarém' 'Lisboa' 'Évora' 'Sines']
    
D=A(2).value

[Q,M]=Warshall_MIN(D)

q=Q(partida,chegada)
m=M(partida,chegada)

C=A(3)
C=C.value

lista=evstr(strsplit(m));

c=0;
P=' '
for i=1:length(m)-1
   c=c+C(lista(i),lista(i+1))
   P=P+I(1,lista(i))+" - "
end
P=P+I(1,lista(i+1))

disp("Para viajar entre "+string(I(1,partida))+" e "+string(I(1,chegada))+" com duração mínima de "+string(q)+" horas, deverá fazer o percurso "+string(P)+", com o custo de "+string(c)+" euros")
W=B

endfunction

viagem_duracao(A,1,2)
