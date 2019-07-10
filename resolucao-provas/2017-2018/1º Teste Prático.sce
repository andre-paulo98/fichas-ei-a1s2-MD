clc
clear

 // 1


A = [1 6 7 11 12 15]
B = [-4:9]
C = []
for i = 1:length(B)
    C(1,i) = ceil(%e^B(1,i))
end


// 1 a
disp("1.a) Cardinalidade de C: " + string(length(C)))

// 1 b
u_AB = union(A, B)
r_1b = setdiff(union(u_AB, C), intersect(u_AB, C))

disp("1.b) conjunto (A U B) + C: ")
disp(r_1b)



// 2

cartoes = [1:410]
multiplos2 = [2:2:410]
multiplos7 = [7:7:410]

r_2a = setdiff(multiplos2, multiplos7)


disp("2.a) Existem " + string(length(r_2a)) + " cartões.")

for i = 1:21
    qp(1,i) = i^2
end

r_2b = intersect(cartoes, qp)

disp("2.b) Os cartões são:")
disp(r_2b)

multiplos3 = [3:3:410]
r_2c = intersect(multiplos3, cartoes)
r_2c = setdiff(r_2c, qp)

disp("2.c) Os cartões são:")
disp(r_2c)



// 4


//IN = input("Indique o número de série: ", "s")

IN = "M50027558701"

P = ["R", "S", "T", "U", "M", "N"]
[L, C] = size(P)

IN = strsplit(IN)

for i = 1:C
    if(IN(1) == P(i))
        IN(1) = string(i)
    end
end

IN = evstr(IN);

[c, _] = size(IN)

soma = 0
for i = 1:c
    soma = soma + IN(i)
end

if pmodulo(soma, 9) == 0
    disp("4. b) A nota é válida")
else
    disp("4.b) A nota não é válida")
end


