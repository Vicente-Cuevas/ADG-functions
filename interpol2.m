function VALOR=interpol2(data,j,peso,x,y)
% INPUT: 
%   data: Datos limpios
%   j: numero de interpolaciones
%   peso: vector peso para cada interpolacion (en orden desde la primera hasta la
%   ultima)
%   x: número de fila del dato a interpolar
%   y: numero de columna del dato a interpolar
%OUTPUT
%   valor

data5=data;
%x=find(tiempo==1880);
%y=8;
data5(x,y)=0;
%j=3;
suma=zeros(1,j);
for n=1:j

    for i=x-n:x+n;
        for e=y-n:y+n
        suma(n)=suma(n)+data5(i,e);
        end
    end
    
end
sumita(1)=suma(1);
for k=1:j-1
    sumita(k+1)=(suma(k+1)-suma(k))/(8*(k+1));
end
sumita(1)=sumita(1)/8;
VALOR= sum(sumita.*peso);

end
