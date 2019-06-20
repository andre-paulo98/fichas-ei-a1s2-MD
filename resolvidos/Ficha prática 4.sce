//Matemática Discreta - Proposta de resolução da ficha prática 4

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.


//Exercício 1
//a)
ceil(100/8)

//b)
function y=conversor(x)
    y=ceil(x/8)
    disp("Para codificar "+string(x)+" de bits são necessários "+string(y)+" bytes")
endfunction

conversor(700)

//Exercício 2

function y=inteiro(x)
    if x>=0 then
    y=floor(x)
    else
    y=ceil(x)
    end
endfunction

//Exercício 3

function bissexto
    X=input("Indique o ano: ")
    if pmodulo(X,4)~=0 | (pmodulo(X,100)==0 & pmodulo(X,400)~=0) then
        disp(string(X)+" não é um ano bissexto")
    else
        disp(string(X)+" é um ano bissexto")
    end
endfunction

//ou

function bissexto
    X=input("Indique o ano: ")
    if pmodulo(X,4)~=0 then
        disp(string(X)+" não é um ano bissexto")
    else
        if pmodulo(X,100)~=0 then
        disp(string(X)+" é um ano bissexto")
        else 
             if pmodulo(X,400)~=0
             disp(string(X)+" não é um ano bissexto")
             else
             disp(string(X)+" é um ano bissexto")
             end
        end
    end
endfunction

//Exercício 4

function y=F(n)
    L(1)=1
    L(2)=1
    for i=3:n 
        L(i)=F(i-1)+F(i-2)
    end
    y=L(n)
endfunction

//ou

function F(n)
F=[1 1];
for i=3:n
   F(1,i)=F(1,i-1)+F(1,i-2)
end
disp("O termo de ordem "+string(n)+" da Sucessão Fibonacci é o:")
disp(F(1,n))
endfunction

//ou

function z=F(n)
if n==1
    z=1;
elseif n==2
    z=1;
elseif n>=3
    z=F(n-1)+F(n-2)
end
endfunction

//Exercício 5

function soma=soma_Fib(n)
soma=0;
for i=1:n
    soma=soma+F(i);
end        
endfunction

//Exercício 6

//recorrendo à função "soma_Fib" definida no exercício anterior:

function v=termosFib(s)
    i=1
    while soma_Fib(i)<=s
        v(1,i)=F(i)
        i=i+1;
    end
endfunction

//ou sem recorrer à função "soma_Fib" definida no exercício anterior:

function v=termos_Fib(s)
n=1;
soma=F(1);
while s>soma
   v(1,n)=F(n)
   n=n+1
   soma=soma+F(n)
end
endfunction

//Exercício 7

//recorrendo à função F definida anteriorente 

format(20) //para aumentar o número de casas decimais consideradas

phi=(1+5^(1/2))/2;
n=2;
while abs(F(n)/F(n-1)-phi)>10^(-10)
    n=n+1;
end
disp(F(n)/F(n-1))

disp(F(n)/F(n-1), "A aproximação do número de ouro, obtida através dos números da sequência de Fibonacci, com um erro inferior ao desejado é dada por F("+string(n)+")/F("+string(n-1)+"):")

//ou

Nouro=(1+sqrt(5))/2;
r=1
n=2
while abs(r-Nouro)>10^-10
    r=F(n)/F(n-1);
    n=n+1;
end
disp("A aproximação do número de ouro obtida é "+string(r))

//b)

X=[1:25]
for i=1:25
    Y(1,i)=F(i+1)/F(i)
end
plot(X,Y,"*r")


//Exercício 8

function z=Ackermann(x,y)
if x==0 then
    z=y+1
else
    if ((x>0 & y==0)&(int(x)==x & int(y)==y)) then
        z=Ackermann(x-1,1)
    else
        if ((x>0 & y>0)&(int(x)==x & int(y)==y)) then
        aux=Ackermann(x,y-1);
        z=Ackermann(x-1,aux)
        else
        disp("Deverá introduzir dois valores inteiros não negativos!")
        abort
        end
    end
end
disp("Ackermann("+string(x)+","+string(y)+") é "+string(z))
endfunction

//Exercício 9
format(25)

function VerificaIgualdade(n)
pri_membro=0;
for k=1:n
   pri_membro=pri_membro+(factorial(k))*k;
end
   seg_membro=(factorial(n+1))-1;
   
if pri_membro==seg_membro then
    disp("A identidade verifica-se para n="+string(n))
else
    disp("A identidade não se verifica para n="+string(n))
end
disp(pri_membro)
disp(seg_membro)
endfunction

VerificaIgualdade(10)
VerificaIgualdade(100)
VerificaIgualdade(500)

//Exercício 10

function natal
Ano=input("Insira o ano: ")

A=pmodulo(Ano,100)
S=ceil(Ano/100)

dia=pmodulo(50+A+(int((S-1)/4))+int(A/4)-2*(S-1),7)

semana=['domingo' 'segunda' 'terça' 'quarta' 'quinta' 'sexta' 'sábado']
disp("O dia da semana em que se celebra o Natal no ano "+string(Ano)+" é "+semana(dia+1))
endfunction

natal

//2017 - segunda
//2023 - segunda
//2015 - domingo

//Exercício 11

//X=input("Introduza o número de série da nota em formato string: ")

X="M50027558701"

X=strsplit(X)'

V=["R" "S" "T" "U" "M" "N"]
[a b]=size(V)

for i=1:b
    if X(1)==V(i) then
        X(1)=string(i)
    end    
end

X=evstr(X)'

soma=0
for i=1:12
    soma=soma+X(i);
end

if pmodulo(soma,9)==0 then
    disp("O número de série da nota é válido")
else
    disp("O número de série da nota não é válido")  
end

//ou

X="M50027558701"

X=strsplit(X)'

V=["R" "S" "T" "U" "M" "N"]

valorletra=find(V==X(1))

soma=valorletra
for i=2:12
    soma=soma+evstr(X(i));
end

if pmodulo(soma,9)==0 then
    disp("O número de série da nota é válido")
else
    disp("O número de série da nota não é válido")  
end

//b)

X="M50027558701"
"O número de série da nota é válido"

//Exercício 12

function cc
    x=input("Insira o número de cartão de crédito: ")
    X=string(x);
    l=length(X)
  
    ultimo=part(X,l)   //retira-se o último dígito
    Y=part(X,1:l-1)    
    
    Z="";    
    for i=1:l-1            //inverte-se posição dos restantes dígitos
        Z=Z+part(Y,l-i) 
    end

    for i=1:l-1                   //substitui-se cada ...
       if pmodulo(i,2)<>0 then
           aux=2*evstr(part(Z,i))
              if aux<=9 then
                 Z=part(Z,1:i-1)+string(aux)+part(Z,i+1:l-1) 
              else
                  aux2=aux-9
                 Z=part(Z,1:i-1)+string(aux2)+part(Z,i+1:l-1) 
              end   
       end
    end
    disp(Z)
    soma=0;
    for i=1:l-1 
        soma=soma+evstr(part(Z,i)) 
    end
    soma=soma+evstr(ultimo);
    if pmodulo(soma,10)==0 
        disp("O número de cartão de crédito inserido é válido")
    else
        disp("O número de cartão de crédito inserido não é válido")   
    end
    y=soma; 
endfunction

cc

//4012888888881882 não é válido
//378282246310004 não é válido
//371449635398431 é válido

//Exercício 9

MAT=['A' 'B' 'C' 'D' 'E' 'F' 'G' 'H' 'I' 'J' 'L' 'M' 'N' 'O' 'P' 'Q' 'R' 'S' 'T' 'U' 'V' 'X' 'Z'];

palavra="MLZ"

function y=f(p)
    y=pmodulo((3*p+3),23) 
endfunction

k=length(palavra)
descodif=""

for i=1:k
a=part(palavra,i)
  for j=1:23 
      if a==string(MAT(1,j)) then
        m=f(j-1);
        descodif=descodif+string(MAT(1,m+1)) 
      end    
  end
end
disp("A palavra descodificada é "+string(descodif))
