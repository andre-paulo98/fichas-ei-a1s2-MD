//Matemática Discreta - Proposta de resolução da ficha prática 3

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.

//Exercício 1

A=[1 2 3 4];
B=[3 4 5 6 7];
C=[1 5 9 10];

//a)
U=union(union(A,B),C)

//b)
length(U)

//c)
setdiff(U,A)

//d)
setdiff(A,B)

//e)
union(setdiff(A,B),setdiff(B,A))
//ou
setdiff(union(A,B),intersect(A,B))


//Exercício 2

A=[0 1 2 4 8]
B=[3 5]
C=[4 6 8]

//a)
length(intersect(A,C))

//b)
union(setdiff(A,union(B,C)),setdiff(union(B,C),A))


//Exercício 3

function C=simdiff(A, B)
    C=union(setdiff(A,B),setdiff(B,A))
endfunction

//ou

function D=simdiff(A, B)
    D=setdiff(union(A,B),intersect(A,B))
endfunction

//Exercício 4

A=[0,2,5,8,9];
B=[2,3,5];
U=[0,1,2,3,4,5,6,7,8,9];

//a)
length(setdiff(U,A))

//b)
intersect(union(setdiff(A,B),setdiff(B,A)),U)


//Exercício 5

//a

A=[3:3:100]

//ou

A=[]
for i=1:33
    A(1,i)=3*i
end
A

//e

B=[70:7:140]

//ou

B=[]
for n=1:100
    x=7*n;
    if (x>=66 & x<=140) then
       B=union(B,x);
    end
end
B

//há muitas outras formas de definir os conjuntos A e B

C=union(setdiff(A,B),setdiff(B,A))

//a)
B

//b)
D=intersect(union(A,C),B)

//Exercício 6

cartoes=1:410;

//a)
pares=2:2:410
mult7=7:7:410;
length(setdiff(pares,mult7))

disp("Existem "+string(length(setdiff(pares,mult7)))+" cartões nas condições pedidas.")

//b)
quad_perf=[]
for i=1:20
    quad_perf=union(quad_perf,i^2)
end
intersect(cartoes,quad_perf)

//c)
mult3=3:3:410
setdiff(mult3,quad_perf)

//Exercício 7

B=[1 2 3 4];
P=list([1],[2],[3 4]);

for i=1:length(P)
    for j=1:length(P)
        if i<>j & intersect(P(i),P(j))<>[]
                disp("O conjunto dado não é uma partição de B porque a intersecção dos seus elementos, dois a dois, não é vazia")
                abort
        end
    end
end

UP=[]
for i=1:length(P)
    UP=union(UP,P(i));
end

if isequal(unique(UP),unique(B)) then
    disp("O conjunto dado é uma partição de P")
else
     disp("O conjunto dado não é uma partição de P dado que a união dos elementos da partição não é igual a B")   
end

//ou

B=[1 2 3 4];
P=list([1],[2],[3 4]);

c1=%t;
for i=1:length(P)
    for j=1:length(P)
        if i<>j & intersect(P(i),P(j))<>[]
                c1=%f;
        end
    end
end

UP=[]
for i=1:length(P)
    UP=union(UP,P(i));
end

if isequal(unique(UP),unique(B)) then
    c2=%t;
else
    c2=%f;
end   

if c1 & c2 then
    disp("O conjunto dado é uma partição de P")
elseif c1 & ~c2
     disp("O conjunto dado não é uma partição de P dado que a união dos elementos da partição não é igual a B")   
elseif ~c1 & c2
     disp("O conjunto dado não é uma partição de B porque a intersecção dos seus elementos, dois a dois, não é vazia")
end

//Exercício 8
clear
clc

P=input("Introduza o conjunto P em formato lista: ")

for i=1:length(P)
    for j=1:length(P)
        if i<>j & intersect(P(i),P(j))<>[]
                disp("O conjunto dado não pode ser uma partição de um conjunto, visto que a intersecção dos seus elementos, dois a dois, não é vazia")
                abort
        end
    end
end

UP=[]
for i=1:length(P)
    UP=union(UP,P(i));
end

disp(UP,"O conjunto dado é uma partição do conjunto: ")

