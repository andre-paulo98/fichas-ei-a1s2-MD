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
// como a triangular superor