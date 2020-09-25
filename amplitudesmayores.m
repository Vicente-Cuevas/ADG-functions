function [reconstruccion,tabla]=amplitudesmayores(x,recon,n,media)
 %% VARIABLES ENTRADA
  % x: frecuenciograma que contiene la frecuencia, periodo, amplitud y fase 
 % recon: cantidad que quiero reconstruir
 % n : amplitudes mayores que quiero, si quiero toda la serie ordenada
 % respecto a la amplitud usar n=0
 % media: media de los datos originales
 %% VARIABLES SALIDA
 % reconstruccion: matriz reconstruida de los tiempos que quiero (recon)
 % ordenada por amplitudes mayores
 % tabla: tabla de datos  
 

 
 
 
 
%% 
% ordenamos los datos con respecto a las amplitudes de mayor a menor  
[amp_ord,pos]=sort(x(:,3),1,'descend'); 

f_ord=x(pos,1);
T_ord=x(pos,2);
fase_ord=x(pos,4);


% crear tabla y vector, ordenados de mayor a menor segun las amplitudes
if n==0
fase_grados=fase_ord*180/pi;

v=[amp_ord,f_ord,T_ord,fase_ord];

tabla=table(amp_ord,T_ord/12,fase_grados,f_ord);
    
    
else    
frecuencia=f_ord(1:n);    
periodo=T_ord(1:n);
fase=fase_ord(1:n);
amplitud=amp_ord(1:n);
fase_grados=fase*180/pi;
v=[amplitud,frecuencia,periodo,fase];

tabla=table(amplitud,periodo/12,fase_grados,frecuencia);
end
%% reconstrucion del frecuenciograma (se uso la funcion reconstruccion_total.m vista en clases)
[FILAS, COLUMNAS]=size(v);
NUM=FILAS;
f = v(1:NUM,2); % FRECUENCIA
r = v(1:NUM,1); % AMPLITUD
T = v(1:NUM,3); % PERIODO
desf = v(1:NUM,4);% FASE
recon_por_f = []; % recontruccion por banda de frecuencia


if NUM == 1 % es decir para sola una frecuencia (por ejemplo la de mayor amplitud)
    for i = 1:recon
        recon_por_f(1,i) = r*cos(2*pi*f*i + desf);
    end 
else 
    for i = 1:recon
        for j = 1:length(r)
            recon_por_f(j,i) = r(j)*cos(2*pi*f(j)*i + desf(j));
        end
    end
% se le sumo la media para tener la frecuencia 0    
reconstruccion = sum(recon_por_f);%+media; %suma los aportes de todas las bandas de frecuencias
end









end

