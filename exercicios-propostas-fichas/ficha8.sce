clc
clear

// busca em largura

function P =blargura(A,vert)
    
    // A -> matriz de adjacencia
    // vert -> vértice inicial em formato string
    
    L = size(A,1);
    
    estado(1,1:L) = 1
    
    letras = strsplit("ABCDEFJKL")
    
    inicial = find(letras==vert)
    
    fila = list(inicial);
    
    estado(inicial) = 2
    
    Vvisitado = list();
    
    while length(fila) ~= 0
        
        
        Vvisitado($+1) = fila(1);
        estado(fila(1)) = 3
        
        for i=1:L
            
            
            if A(fila(1),i) && estado(i) == 1
                
                fila($+1) = i
                estado(i) = 2
                
            end
            
        end
        
        fila(1) = null();
        
    end
    
     P = Vvisitado;
        
    caminho = vert
    for i = 2:length(Vvisitado)
        caminho = caminho + " - " + letras(Vvisitado(i));
    end
    messagebox("resultado da busca em largura é o seguinte: " + caminho)
    
endfunction


excel = readxls("Grafo_f8.xls");
A=excel(1).value;
blargura(A, 'L');
