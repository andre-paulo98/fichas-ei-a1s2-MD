function L=algoritmo1(A,vert)
[u,v]=size(A)
Estado=ones(1,u)
conjunto=list(vert);
Estado(vert)=2; 

Vvisitado=list();

while length(conjunto)<>0

Vvisitado($+1)=conjunto(1)
Estado(conjunto(1))=3;

for j=1:u 
      if A(conjunto(1),j)==1 & Estado(j)==1 then
          conjunto($+1)=j;
          Estado(j)=2;
      end
end

conjunto(1)=null()

end

L=string(Vvisitado(1));
for i=2:length(Vvisitado)
    L=L+' -> '+string(Vvisitado(i))
end

endfunction
////////////////////////////////////////////////////////7

function L=algoritmo2(A,vert)
[u,v]=size(A)
Estado=ones(1,u)
conjunto=list(vert);
Estado(vert)=2;


Vvisitado=list();

while length(conjunto)<>0
Vvisitado($+1)=conjunto($)
Estado(conjunto($))=3; 
aux=conjunto($); 
conjunto($)=null() 

for j=1:u 
      if A(aux,j)==1 then
          if Estado(j)==1 then
              conjunto($+1)=j;
              Estado(j)=2;
          elseif Estado(j)==2 then
              for i=1:length(conjunto)
                  if conjunto(i)==j
                      conjunto(i)=null()
                      conjunto($+1)=j;                          
                  end
              end
          end
      end
end

end

L=string(Vvisitado(1));
for i=2:length(Vvisitado)
    L=L+' -> '+string(Vvisitado(i))
end

endfunction
