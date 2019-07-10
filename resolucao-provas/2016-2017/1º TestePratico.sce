clc
clear


// 1. a)
A = [12:2:91]
disp("1.a) A: ")
disp (A)


// 1. b)
B = []
for i = 1:length(A)
    r = floor(sin(A(i)))
    if r == 0
         B(1,$+1) = A(i)
    end
end
disp("1.b) B: ")
disp(B)


// 2

A = [0 2 5 8 9]
B = [2 3 5]
U = [0:9]


// 2.a)

CA = setdiff(U, A)
disp("2.a) Complementar A: ")
disp(CA)

// 2.b)

ADB = setdiff(union(A,B), intersect(A,B))
DoisB = intersect(ADB, U)
disp("2.b) ")
disp(DoisB)

// 3.

function r = u(x)
    r = (x^2 + x)/2
endfunction


// 3.a)
disp("3.a) u(4) = " + string(u(4)))

// 3.b)
r = 0
i = 0
while r < 9870
    i = i+1
    r = u(i)
    
end


disp(r)
disp(i)








