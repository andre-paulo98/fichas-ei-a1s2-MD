clear
clc

disp("1.");

A = [2 1 -1; -1 2 1; 1 3 -3];
B = [3; -1; 0];
C = [1 0 -2 2; 0 2 3 0; 1 0 -1 0];
D = [1 -1 0 2];

disp('i) AB = ');
i = A * B;
disp(i);


disp('ii) CD = (impossível)');
//ii = C*D;
//disp (ii);


disp('iii) CD^T = ');
iii = C * D';
disp (iii);


disp('iv) A^-1 * C = ');
iv = inv(A) * C;
// iv = (A ^-1) * C
disp (iv);


disp('v) 3AB + 2CD^T = ');
v = 3 * A * B + 2 * C * D';
disp (v);


disp('vi) A.^2 = ');
vi = A.^2;
disp(vi);





// --------------------------------

disp("2.");

// --------------------------------


//    X0     k     Xn
x = -1.5 : 0.125 : 2.5;

y = x^5 - 3*x^4 - 3*x^3 + 7*x^2 + 6*x;

/*scf(1);
plot(x, y)

scf(2);
plot(x, y, 'ro')*/





// --------------------------------

disp("5.");

// --------------------------------

function soma=Z(n)
    soma = 0;
    for i = 1:n
        soma = soma + (1/2)^ i
    end
endfunction

clear('Y')

for i = 1:20
    Y(1, i) = Z(i);
end
clear('X')
X = 1:20;
plot(X, Y, 'k*')


/*
z = 0


for (i=1:20)
    
    a = 1/(2^i)
    z = z + a
    
    plot(a, x)
    
end

disp(z)
*/
