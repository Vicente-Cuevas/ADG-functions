function [amplitud,fase]= espectrocruzado(x,y,f)
%INPUT: Serie 1, Serie 2, Frecuencia
%OUTPUT: Serie 1, Serie 2, Frecuencia

T=1./f;

for i=1:length(f)
    P1=fourier_mc(x,T(i));
    ax(i)=P1(4);
    bx(i)=P1(5);
    P2=fourier_mc(y,T(i));
    ay(i)=P2(4);
    by(i)=P2(5);
    
end

cx=complex(ax,bx);
cy=complex(ay,by);
concy=conj(cy);

c=cx.*concy;
ac=real(c);
bc=imag(c);

amplitud=sqrt(ac.^(2)+bc.^(2));
fase=-atan2(bc,ac);