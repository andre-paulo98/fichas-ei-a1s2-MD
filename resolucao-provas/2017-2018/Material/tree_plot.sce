function tree_plot(arvore)
    //arvore usando a representação sequencial
    // o valor 0 indica que a subárvore é vazia. 
L1=length(arvore);
//verificar se a árvore é completa
if floor(log2(L1+1))~=ceil(log2(L1+1))
    arvore((2^ceil(log2(L1)))-1)=0;
    L1=length(arvore);
end
////////////////////////////77
L2=floor(log2(length(arvore)));
estado=zeros(1,L1);
////////
plot2d([0;L1],[0;L2+2],0)
a=gca(); // Handle on axes entity 
a.axes_visible=["off" "off"];

///////
passoy=L2+1;
k=1;
for i=1:log2(L1+1)
    passo=(2^(L2+1))/2^i;
    for j=passo:passo:L1

        if estado(j)==0
            if arvore(k)~=0
                xstring(j,passoy,string(arvore(k)));
            end
            retax($+1)=j;
                retay($+1)=passoy;
                k=k+1;
                estado(j)=1;
        end
    end
    passoy=passoy-1;
end
reta(:,1)=retax;
reta(:,2)=retay;
[L C]=size(reta);
for i=1:L
    if 2*i<=L
        if  arvore((2*i))~=0
        xarrows([reta(i,1),reta(2*i,1)],[reta(i,2),reta(2*i,2)],1)
    end
    end
    if (2*i)+1<=L
        if arvore((2*i)+1)~=0
            xarrows([reta(i,1),reta((2*i)+1,1)],[reta(i,2),reta((2*i)+1,2)],1)
            end
    end
    
end


  
endfunction
