clear
clc

printf("\n\n")

resultado = (35.6 * 64 - 7^3)/(45 + 5^2)
disp("1 a) = " + string(resultado))

printf("\n")

resultado = (5/7) * 4 * 6^2 - ((3^7)/(9^3-236))
disp("1 b) = " + string(resultado))

printf("\n")

resultado = ((3^2 * log10(76))/(7^3 + 54)) + 910^(1/3)
disp("1 c) = " + string(resultado))

printf("\n")


resultadoA = (cos((5 * %pi)/6) ^ (2))
resultadoB = (sin(((7 * %pi)/8)^ 2))
resultadoC = ((tan((%pi/6)*log(8)))/(sqrt(7)))

resultado = (resultadoA * resultadoB) + resultadoC
disp("1 d) = " + string(resultado))


clear()
printf("\n\n")
printf("-------------------------------------")
printf("\n\n")




x = 13.5

resultado = x^3 - 2*x + 23.5 * x^2
disp("2 a) = " + string(resultado))

printf("\n")

resultadoA = (sqrt(14 * (x ^ 3)))
resultadoB = (%e ^ (3 * x))
resultado = resultadoA / resultadoB

disp("2 b) = " + string(resultado))

printf("\n")

resultado = log10(abs(x^2 - x^3))
disp("2 c) = " + string(resultado))


clear()
printf("\n\n")
printf("-------------------------------------")
printf("\n\n")


a = 15.62
b = -7.08
c = 62.5
d = 0.5 * ((a * b) - c)

resultadoA = (a * b)/c // C
resultadoB = (a + d) ^ 2 // C
resultadoC = sqrt(abs(a * b)) // C
resultadoD = resultadoB / resultadoC

resultado3A = a + resultadoA * resultadoD

disp("3 a) = " + string(resultado3A))

printf("\n")


//

resultadoA = d * (%e)^(d/2) 
resultadoB = a * d + c * d
resultadoC = (20/a) + (30/b)
resultadoD = resultadoB / resultadoC
resultado3B = resultadoA + (resultadoD / (a + b + c +d))

disp("3 b) = " + string(resultado3B))


printf("\n\n")
printf("-------------------------------------")
printf("\n\n")


disp("3 a) O resultado obtido na alínea a) foi " + string(resultado3A))
disp("3 b) O resultado obtido na alínea b) foi " + string(resultado3B))


clear()
printf("\n\n")
printf("-------------------------------------")
printf("\n\n")


p = %t
q = %f

r = p | q

disp("p OU r = " + string(r))



clear()
printf("\n\n")
printf("-------------------------------------")
printf("\n\n")



a = %t
b = %f
c = %t

p = a & b
q = (a | b) & (~b & c)

disp("a & b = " + string(p))
disp("(a | b) & (~b & c) = " + string(q))



printf("\n\n")
printf("-------------------------------------")
printf("\n\n")


// tabelas de verdade ???



clear()
printf("\n\n")
printf("-------------------------------------")
printf("\n\n")



p = [%f, %f, %t, %t]
q = [%f, %t, %f, %t]

r = ~(p & (~p | q)) | q

disp("Resultado de: ~(p & (~p | q)) | q")
disp(r)

// tabela de verdade???



clear()
printf("\n\n")
printf("-------------------------------------")
printf("\n\n")


p = [%f, %f, %t, %t]
q = [%f, %t, %f, %t]

r = ~(p & (~p | q))
t = ~(p & q)

f = r == t

disp("Resultado: ")
disp(f)
