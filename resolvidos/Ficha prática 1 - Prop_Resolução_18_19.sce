//Matemática Discreta - Proposta de resolução da ficha prática 1

//Nota: As resoluções que se seguem apresentam apenas sugestões de resolução dos exercícios propostos. Na maior parte dos casos, existem muitas outras formas de resolver o exercício.

//Exercício 1

//a)
ex1a=(35.6*64-7^3)/(45+5^2);
disp(ex1a,"ex1a")

//b)
ex1b=5/7*4*6^2-3^7/(9^3-236);
disp(ex1b,"ex1b")

//c)
ex1c=(3^2*log10(76))/(7^3+54)+(910)^(1/3);
disp(ex1c,"ex1c")

//d)
ex1d=(cos(5*%pi/6))^2*(sin((7*%pi/8)^2))+tan(%pi/6*log(8))/sqrt(7);
disp(ex1d,"ex1d")

//Exercício 2

x=13.5;

//a)
ex2a=x^3-2*x+23.5*x^2;
disp(ex2a,"ex2a")

//b)
ex2b=sqrt(14*x^3)/exp(3*x);
disp(ex2b,"ex2b")

//c)
ex2c=log10(abs(x^2-x^3));
disp(ex2c,"ex2c")

//Exercício 3
a=15.62;b=-7.08;c =62.5;d=0.5*(a*b-c);

//a)
ex3a=a+a*b/c*(a+d)^2/sqrt(abs(a*b));
disp(ex3a,"ex3a")

//b)
ex3b=d*exp(d/2)+((a*d+c*d)/(20/a+30/b))/(a+b+c+d);
disp(ex3b,"ex3b")

//Exercício 4

disp("ex4")
disp('3 a) O resultado obtido na alínea a) foi '+string(ex3a));
disp('3 b) O resultado obtido na alínea b) foi '+string(ex3b));

//Exercício 5
disp("ex5")
p=%t;q=%f;
r=p|q
disp(r)

//Exercício 6

//a)
disp("ex6a")
a=1;b=0;c=1;
p=a&b
disp(p)

//b)
disp("ex6b")
q=(a|b)&(~b&c)
disp(q)

//Exercício 7
disp("ex7")
a=[1 1 0 0];b=[1 0 1 0];
p=a&b;
TV=[a' b' p'];
disp(TV)

a=[1 1 1 1 0 0 0 0];b=[1 1 0 0 1 1 0 0];c=[1 0 1 0 1 0 1 0];
q=(a|b)&(~b&c);
TV=[a' b' c' q'];
disp(TV)

//Exercício 8
disp("ex8")
p=[1 1 0 0];q=[1 0 1 0];

r=~(p&(~p|q))|q;

TV=[p' q' r']
disp(TV)

disp("A proposição é uma tautologia porque, na sua tabela de verdade, a última coluna só contém uns, ou seja, para quaisquer entradas, a saída tem valor lógico verdadeiro.")

//Exercício 9
disp("ex9")
p=[1 1 0 0];q=[1 0 1 0];
r=~(p&(~p|q));
s=~(p&q);

TVr=[p' q' r'];
TVs=[p' q' s'];
disp(TVr)
disp(TVs)

disp("As proposições são logicamente equivalentes porque as suas tabelas de verdade são iguais.")
