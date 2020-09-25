function[RES]=frecuenciograma(datos)%funcion para calcular la amplitud en funcion de la frecuencia
%
%
%% REVISION y MODIFICACION: Prof. R. Abarca del Rio. 01-06-2019 : curso ADG / GEOFISICA
%% funcion inicialmente creada por estudiante ayudante : M. Sepulveda : 2017.
% 
% ENTRADA : datos : columna de datos (solo los datos, no contiene columna
% de fechas)
% SALIDA : RES (matriz de 4 columnas. frecuencia, periodo, amplitud, fase
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
contador=0;
d=datos;

N=length(d);
dt=1;
fn=1/2*dt; %    frecuencia de nyquist
f0=1/(dt*N); %  frecuencia fundamental
matriz=[];
for f=f0:f0:(fn-f0) %definimos el aumento linear en frecuencia, basandose en la fundamental
  [R,psi]=coeficientes_sinusoidales(d,f);
  %%
    
  contador=contador+1; %posicion de los valores  
  matriz(contador,1)=f;     %1era columna frecuencias
  matriz(contador,2)=1./f;  %2nda columna periodicidades
  matriz(contador,3)=R;     %3ra columna amplitudes
  matriz(contador,4)=psi;	%4ta columna fases
 
  R=0;  %volvemos a hacer 0 el valor de R y de psi....
  psi=0;
end

RES=matriz; % se transvasan las columnas a una matriz de salida.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
