function[R,psi,A,B]=coeficientes_sinusoidales(datos,frec)
%
%con esta funcion calculamos la amplitud y la fase utilizando los minimos
%cuadrados desarrollados en clase
%
%
%
%% REVISION y MODIFICACION: Prof. R. Abarca del Rio. 01-06-2019 : curso ADG / GEOFISICA
%% funcion inicialmente creada por estudiante ayudante : M. Sepulveda : 2017.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
y_cos=0;
sin_c=0;
y_sin=0;
cos_sin=0;
cos_c=0;
w=2*pi*frec; %Definimos la frecuencia
largo=length(datos);
  for t=1:largo;  % valores desde 1 hasta el largo de la columna de datos
    y_cos = y_cos + datos(t)*cos(w*t); %terminos de la ecuacion
    sin_c = sin_c + sin(w*t)^2;
    y_sin = y_sin + datos(t)*sin(w*t);
    cos_sin = cos_sin + cos(w*t)*sin(w*t);
    cos_c = cos_c + cos(w*t)^2;
  end

  delta=(cos_c*sin_c)-(cos_sin)^2;

  A=((y_cos*sin_c)-(y_sin*cos_sin))/delta; % ecuacion para calcular A
  B=((y_sin*cos_c)-(y_cos*cos_sin))/delta; %para calcular B

  R=sqrt(A^2+B^2);  % Amplitud
  psi=-atan2(B,A);  % Fase (en radianes)

  %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  

  
