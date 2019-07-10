clc
clear

A = []
for i = 1:29
    
    A(1,$+1) = pmodulo(factorial(i), 5)
    //disp("i = " + string(i) + "; fatorial = " + string(factorial(i)) + "; pmodulo = " + string(pmodulo(factorial(i),5)))
    
end
A = unique(A)
disp(A)

B = [4:7]

// 2.a)

disp(length(intersect(A,B)))

// 2.b)

DB = setdiff(union(A,B), intersect(A,B))

disp(DB)

function r = fibonacci(n)
    r = 0
    if(n == 1 || n == 2)
        r = 1
    else
        r = fibonacci(n-2) + fibonacci(n-1)
    end
endfunction

















