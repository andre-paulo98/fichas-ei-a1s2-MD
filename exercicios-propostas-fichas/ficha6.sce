//   1 2 3 4 5 6
A = [0 1 0 0 1 0; // 1
     0 0 1 1 0 0; // 2
     1 0 0 0 1 0; // 3
     0 0 0 0 0 0; // 4
     0 0 0 0 0 1; // 5
     1 0 0 1 0 0] // 6
     
 //exec('grafo.sce')
 grafo(G)

// estudar a conetividade
// vamos construir a matriz de caminhos: P

Bm = A
for i=2:6
    Bm = Bm + A^i // Bm é a matriz com o numero de caminhos
end

P = bool2s(Bm) // matriz com 0 e 1

// como a matriz P tem zeros o grafo não é fortemente conexo


// ver se é unilateral
P1 = bool2s(P + P')
// como a triangular superior (ou inferior) não tem zeros, o grafo é unilateralmente conexo


// tpc






function I=conectividade(A)
    
    // I = 3  -> fortemente conexo
    // I = 2  -> unilateralmente conexo
    // I = 1  -> fracamente conexo
    // I = 0  -> desconexo
    
    
    [L, C] = size(A)
    I = 3
    
    Bm = A
    for i=2:L
        Bm = Bm + A^i // Bm é a matriz com o numero de caminhos
    end
    
    P = bool2s(Bm);
    
    
    
    // verificação para fortemente conexo
    for i=1:L
        for j=1:C
            if(P(i, j) == 0)
                I = 2;
                disp("Não é fortemente conexo");
                break;
        end
        if I == 2
            break;
        end
    end
    
    
    // ver se é unilateralmente conexo
    if I==2
        
        P1 = (P + P');
        
        for i=1:L-1
            for j=i+1:L // triangular superior
                if P1(i,j) == 0
                    I = 1;
                    disp("Não é unilateralmente conexo");
                    break;
            end
            if I == 1
               break;
            end
        end
    end
    
    if I==1
        
        A1 = bool2s(A+A') // matriz de um grafo não orientado
        
        Bm = A1;
        for i=2:L
            Bm = Bm + A^i // Bm é a matriz com o numero de caminhos
        end
        
        P = bool2s(Bm);
        
        
        
        // verificação para fracamente conexo
        for i=1:L
            for j=1:C
                if(P(i, j) == 0)
                    I = 0;
                    disp("Não é fracamente conexo");
                    break;
            end
            if I == 0
                break;
            end
        end
        
        
        
        
    end
    
    
    if(I == 3)
        disp("É fortemente Conexo")
    elseif I ==2
        disp("É unilateralmente conexo")
    elseif I == 1
        disp("É fracamente conexo")
    elseif I == 0
        disp("É desconexo")
    end
    
    
        
endfunction







