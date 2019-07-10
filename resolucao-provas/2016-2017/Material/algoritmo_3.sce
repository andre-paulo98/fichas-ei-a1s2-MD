
function B=insert_tree(A,item)
k=1;
L=length(A);
aux=1;
while aux==1
    if item > A(k)
        k=2*k+1;
        if (k>L | A(k)==0)
            A(k)=item;
            disp('Item foi inserido na árvore!')
            aux=0;
        end
    elseif item < A(k) 
        k=2*k;
         if k>L | A(k)==0
            A(k)=item;
            disp('Item foi inserido na árvore!')
            aux=0;
        end
    elseif item==A(k)
        disp('Item = '+string(item)+' foi encontrado na posição '+string(k))
        aux=0;
    end
end
B=A;
endfunction
