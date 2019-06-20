//Matemática Discreta - Proposta de resolução da ficha prática 5

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.

function M=um(A)    //função equivalente à função bool2s
    V=size(A)
    for i=1:V(1)
       for j=1:V(2)
          if A(i,j)<>0
             A(i,j)=1
          end
       end
    end
    M=A;
endfunction

//Exercício 1

//a)
//A matriz que representa a relação R é

MR=[1 0 1 0
    1 0 1 0
    1 1 0 0
    0 0 0 1]
 
//b)
//A matriz que representa a relação R^-1 é MR'

MR'
    
//c)
//A matriz que representa a relação R^2 é

um(MR*MR)
//ou 
bool2s(MR*MR)

//E a matriz que representa a relação R^3 é  

um(MR^3) 

//d)

MR=[1 0 1 0
   1 0 1 0
   1 1 0 0
   0 0 0 1]

//A não é reflexiva porque (2,2) e (3,3) não pertencem a R (a diagonal da matriz da relação R contém zeros)

//A não é simétrica porque (2,1) pertence a R mas (1,2) não pertence a R (MR é diferente da transposta de MR)

//A não é antissimétrica porque os pares (1,3) e (3,1) pertencem a R.

//A não é transitiva porque os pares (2,3) e (3,2) pertencem a R, mas (2,2) não pertence a R (ou (3,1) e (1,3) pertencem a R mas (3,3) não pertence a R)

//e)
//i) a matriz do fecho reflexivo é:
Ai=[1 0 1 0
    1 1 1 0
    1 1 1 0
    0 0 0 1]
//  reflexivo(R)={(1,1),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,4)}.

//ii) a matriz do fecho simétrico é:
Aii=[1 1 1 0
     1 0 1 0
     1 1 0 0
     0 0 0 1]
   //   simetrico(R)={(1,1),(1,2),(1,3),(2,1),(2,3),(3,1),(3,2),(4,4)}.

//iii) a matriz do fecho transitivo é:
Aiii=[1 1 1 0
      1 1 1 0
      1 1 1 0
      0 0 0 1]
   //   transitivo(R)={(1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,4)}.

//f)
// A menor relação de equivalência definida em A que contém o conjunto R tem como matriz de relação a matriz:

Af=[1 1 1 0
    1 1 1 0
    1 1 1 0
    0 0 0 1]

// R={(1,1),(1,2),(1,3),(2,1),(2,2),(2,3),(3,1),(3,2),(3,3),(4,4)}.

//g)
//Classes de equivalência de S:
// [1]=[2]=[3]={1,2,3}
// [4]={4}
   
//Conjunto quociente A/S:
// A/S={{1,2,3},{4}}
 
//A partição do conjunto A determinada pelo conjunto quociente A/S é o próprio conjunto quociente A/S.

//Exercício 2

MR=[0 1 0
    1 1 1
    1 0 0]

MS=[0 1 0
    0 1 1
    1 1 1]


//a)
//a matriz associada à relação R∘S é

um(MR*MS)
//ou
bool2s(MR*MS)

//b)

//c não está RºS relacionado com a porque, na posição (3,1) da matriz anterior temos um zero, e não um 1.

//    0.    1.    1.  
//    1.    1.    1.  
//    0.    1.    0.

//Exercício 3

function M=relcomp(MR,MS)
    M=um(MR*MS)
endfunction

//Exercício 4
//a)

function r=is_reflexiva(M)
    [a b]=size(M)
    r=%t
    for i=1:a
        if M(i,i)==0 then
            r=%f
        end
    end
    if r then
        disp("A relação é reflexiva")
    else
        disp("A relação não é reflexiva")  
    end
endfunction

//ou

function r=is_reflexiva(M)
    [a b]=size(M)
    contador=0;
    for i=1:a
        contador=contador+M(i,i)
    end
    if contador==a then
        r=%t
        disp("A relação é reflexiva")
    else
        r=%f  
        disp("A relação não é reflexiva")
    end
endfunction

//b)

function s=is_simetrica(M)
    if isequal(M,M')
        s=%t
        disp("A relação é simétrica")
    else
        s=%f
        disp("A relação não é simétrica")  
    end
endfunction

//ou

function s=is_simetrica(M)
    [a b]=size(M)
    s=%t
    for i=1:a
        for j=1:b
            if M(i,j)<>M(j,i)
                s=%f
            end
        end
    end
    
    if s then 
        disp("A relação é simétrica")
    else
        disp("A relação não é simétrica")  
    end
endfunction

//c)

function t=is_transitiva(M)
    [a b]=size(M)
    
    A=zeros(a,b);
    for i=1:a
        A=A+M^i;
    end
    A=bool2s(A)
    
    if isequal(A,M) then
        t=%t 
        disp("A relação é transitiva")
    else
        t=%f
        disp("A relação não é transitiva")  
    end
    disp(A,"A")
endfunction

//ou

function t=is_transitiva(M)
    [a b]=size(M)

    if isequal(M,bool2s(M+M^2)) then
        t=%t 
        disp("A relação é transitiva")
    else
        t=%f
        disp("A relação não é transitiva")  
    end
endfunction

//Exercício 5

function r=fecho_reflexivo(M)
    r=%t
    [a b]=size(M)
    for i=1:a
        if M(i,i)==0 then
            r=%f
        end
    end        
    if r then
        disp("A relação é reflexiva")
    else
        disp("A relação não é reflexiva. A matriz do seu fecho reflexivo é ")
        A=bool2s(M+eye(a,b))
        disp(A,"reflexivo(M)=")  
    end
endfunction

//ou

function fecho_reflexivo(M)
    if is_reflexiva(M) then
        disp("A relação é reflexiva")
    else
        disp("A relação não é reflexiva. A matriz do seu fecho reflexivo é ")
        for i=1:size(M,1)
            M(i,i)=1;
        end        
        disp(M,"reflexivo(M)=")  
    end
endfunction


//Exercício 6

function e=equival(M)
    [a b]=size(M);
    if is_reflexiva(M)& is_simetrica(M)& is_transitiva(M)
        disp("A relação dada é uma relação de equivalência")
        e=M;
    else 
        disp("A relação dada não é uma relação de equivalência. A menor relação de equivalência que contém a relação R tem a seguinte matriz de relação:")
        Zeros=zeros(a,b)
        Ident=eye(a,b)
        
        A=um(Ident+M+M')
        e=Zeros;
        for i=1:a
            e=e+A^i;
        end
        e=bool2s(e);
    end
endfunction


//Exercício 7

function as=is_antissimetrica(M)
    as=%t
    [a b]=size(M)
    for i=1:a
        for j=1:b
            if i<>j & M(i,j)==1 & M(j,i)==1
                as=%f
            end
        end
    end
    
    if as then 
        disp("A relação é antissimetrica")
    else
        disp("A relação não é antissimetrica")  
    end
endfunction

function orparcial(M)
    [a b]=size(M);
    if is_reflexiva(M)& is_antissimetrica(M)& is_transitiva(M)
        disp("A relação dada é uma relação de ordem parcial")
    else 
        disp("A relação dada não é uma relação de ordem parcial")
    end
endfunction

//Exercício 8

//A função 1 NÃO permite determinar se a relação é reflexiva. Note-se que a avaliação é feita isoladamente, para cada elemento da diagonal principal, o que não permite concluir o pretendido.

// A função 2 permite determinar se a relação é reflexiva. Ao calcular o traço da matriz, estamos a determinar o número de "1's" da diagonal principal; se este número for igual à ordem, a relação é reflexiva.

// A função 3 permite determinar se a relação é reflexiva, pois estamos a comparar a matriz da relação com a matriz do fecho reflexivo. 

//Exercício 9

// A função 1 permite obter a matriz do fecho simétrico dado que obriga a que, se i está em relação com j, o j terá que estar em relação com o i.

// A função 2 NÃO permite obter a matriz do fecho simétrico dado é possível que o output contenha elementos de valor superior a 1. 

// A função 3 permite obter a matriz do fecho simétrico dado que corrige o erro da função anterior, pela aplicação da função bool2s.
