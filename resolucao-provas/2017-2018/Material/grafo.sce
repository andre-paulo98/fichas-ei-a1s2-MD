function curva(x,y,dim,pos)
    //x,y é a posição do nó
    //dim é a dimensão da matriz de adjacências
    //pos representa a posição no vetor angle
beta=0.5;
a=get("current_axes")//get the handle of the newly created axes
a.data_bounds=[-2,-2;15,15];
t=2*%pi*(0:19)/20;
xx=[x+beta*cos(t)+beta*cos(pos);y+beta*sin(t)+beta*sin(pos)];

xpoly(xx(1,:),xx(2,:),"lines",0)
 
p1=get("hdl"); //get handle on current entity (here the polyline entity)
//p.foreground=2;
//p.thickness=3;
p1.mark_mode='off'
t1=2*%pi*(19:20)/20;
xy2=[x+beta*cos(t1)+beta*cos(pos);y+beta*sin(t1)+beta*sin(pos)];


xpoly(xy2(1,:),xy2(2,:),"lines",0)
p2=get("hdl")
p2.polyline_style=4;
p2.arrow_size_factor=2;

endfunction



function grafo(M)
[L C]=size(M);
a=get("current_axes")//get the handle of the newly created axes
a.data_bounds=[-10,-10;15,15];
t=[0:C-1]*2*%pi/C;
x=5+5*cos(t);
y=5+5*sin(t);
///////////////////////////////
x1=x+0.7*cos(t);//para colocar a identificação dos vértices
y1=y+0.7*sin(t);//para colocar a identificação dos vértices
/////////////////fazer as curvas/////////////
for i=1:C
   if M(i,i)==1
     curva(x(i),y(i),C,t(i))
     end      
end

/////////////////////////////
k1=1;
k2=1;
for i=1:C
    for j=1:C
        if i~=j
            if M(i,j)==1
               XX(1,k1)=x(i);
               XX(1,k1+1)=x(j);
               YY(1,k1)=y(i);
               YY(1,k1+1)=y(j);
               k1=k1+2;
           end
         end
    end
end
//xpoly(XXX,YYY,"marks")
//e=gce();
//set(e,"mark_style",9);
//set(e,"mark_size",10);
//set(e,"mark_mode","on");

e=gce();
xarrows(XX',YY',7)
xset("font",1,5);
xstring(x1,y1,string(1:C))
endfunction



