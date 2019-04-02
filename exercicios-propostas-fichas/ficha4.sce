clc
clear

disp('3.')
function y = bissexto(ano)
    y = %f
    if(pmodulo(ano, 4) == 0)
        if(pmodulo(ano, 100) == 0 && pmodulo(ano, 400) ~= 0)
            y = %f
        else
            y = %t
         end
    end
endfunction




function y = F(n)
    if(n == 1 || n == 2)
        y = 1
    else
        F0=1;
        F1=1;
        for i=1:n-2
            F2 = F0 + F1;
            F0 = F1;
            F1 = F2;
        end
        y = F2;
    end
    
endfunction


function y = soma_Fib(n)
    y = 0
    for i=1:n
        y = y + F(i)
    end
endfunction

function V = termos_Fib(S)
    
    i = 1
    soma = 0
    while soma <= S
        soma = soma + F(i)
        V(i) = F(i);
        i = i+1
    end
    
    V = V(1:$-1)
endfunction


function saida =  NumOuro()
    
    ouro = (1 + sqrt(5)) / 2;
    erro = 1;
    n = 2;
    
    while (erro > 10^-10)
        
        aprox = F(n) / F(n-1)
        plot(n-1, aprox, 'r*')
        erro = abs(ouro - aprox)
        
        n = n+1
        
    end
    
    
    saida = aprox
    
endfunction


function verificaSerieNota()
    
    //x = input("Indique o número de série: ", "string")
    x = "M50027558701"
    V = strsplit(x)
    ltr = ['R', 'S', 'T', 'U', 'M', 'N']
    
    vletra = find(ltr == V(1))

    soma = vletra;
    for i = 2:12
        soma = soma + evstr(V(i))
    end
    
    if(pmod(soma, 9) == 0) 
        disp ("o numero é válido")
    else
        disp ("não é válido")
    end
    
    
    
    
endfunction
verificaSerieNota()






