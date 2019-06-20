//Matemática Discreta - Proposta de resolução da ficha prática 2

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.

//Exercício 1

A=[2 1 -1
-1 2 1
1 3 -3];

B=[3;-1;0];

C=[1 0 -2 2
0 2 3 0
1 0 -1 0];

D=[1 -1 0 2];

//a)
//i)
A*B

//ii)
// C*D
//não é possível efetuar o cálculo visto que o número de colunas de C (4) é diferente do número de linhas de D (1).

//iii)
C*D'

//iv)
// A*B'
//não é possível efetuar o cálculo visto que o número de colunas de A (3) é diferente do número de linhas de B' (1).

//v)
inv(A)*C

//vi)
3*A*B+2*C*D'

//vii
A.^2

//viii)
A*A
//ou
A^2

//ix)
det(A*A')

//x)
B*D*C'

//xi)
(inv(A))^2
//ou
A^-2

//xii)
//não é possível efetuar o cálculo visto que o número de colunas de A^2 (3) é diferente do número de linhas de B' (1).

//b)
C(:,2:3)

//Exercício 2

scf(1) //abre uma nova janela gráfica designada por "Graphic window number 1"(para que as representações gráficas fiquem em janelas diferentes, evitando assim que as mesmas sejam feitas na mesma janela)

function y = f(x)
    y = x.^5-3*x.^4-3*x.^3+7*x.^2+6*x
endfunction

X=[-1.5: 0.125 : 2.5];
Y=f(X);
plot (X,Y,"r")
xtitle ( " Função polinomial f " , "eixo dos xx" , "eixo dos yy" );
legend ( "y=x^5-3*x^4-3*x^3+7*x^2+6*x" );
 
//ou
 
scf(2)

x =[-1.5: 0.125 : 2.5];
plot(x,y=x.^5-3*x.^4-3*x.^3+7*x.^2+6*x)

//Exercício 3

//a)
function y=f(x)
    y=cos(x)+exp(x)
endfunction

//b)
f(0)
f(%pi)

//c)
X=linspace(1,2,98)

//d)
f(X)
//É criado um novo vector cujos elementos são as imagens dos elementos do vector X por f

//e)
scf(3)
plot(X,f(X))

//Exercício 4

scf(4)

function y = r(t)
   C0=10;
   v=140;
   y = C0*(0.5)^(t/v)
endfunction
    t = 0:7:70;
    y = r(t);
    plot (t,y,"r+")
    xtitle ( "Quant. restante de polónio" , "t (dias)" , "y (gramas)" );


//Exercício 5

function soma=Z(n)
    soma=0;
    for k=1:n
        soma=soma+(1/2)^k
    end
endfunction

scf(5)
N=1:20;
for n=1:20
    T(1,n)=Z(n);
end
plot(N,T,"b*")

//ou
scf(6)
for n=1:20
    L(n)=Z(n)
end
plot(L,"c*")


//b)
n=2;
while abs(Z(n)-Z(n-1))>=10^(-10)
    n=n+1;
end
disp(n)

//Exercício 6

//nota: quando utilizar o comando "input", execute o algoritmo na opção "executar sem eco"

clc
clear
nota_PT1=input("Nota da 1.ª prova teórica: ")
nota_PT2=input("Nota da 2.ª prova teórica: ")
nota_CP=input("Nota da prova prática: ")

nota_CT=(nota_PT1+nota_PT2)*0.5;

if (nota_CT<8 | nota_CP<8) then 
    disp("Não atingiu o mínimo numa das componentes.")
else
    resultado=0.60*nota_CT+0.4*nota_CP;
    disp("Classificação final na UC de Matemática Discreta: "+string(resultado)+" valores.")
end
