function L=bprofundidade(A,vi)
[u,v]=size(A)

Estado=ones(1,u)
Pilha=list(vi);
Estado(vi)=2;

Vvisitado=list();

while size(Pilha)<>0  
Vvisitado($+1)=Pilha($)
Estado(Pilha($))=3; 
aux=Pilha($); 
Pilha($)=null() 

for j=1:u 
      if A(aux,j)==1 & Estado(j)==1 then
      Pilha($+1)=j;
      Estado(j)=2;
      end
end

L=Vvisitado
end
endfunction
