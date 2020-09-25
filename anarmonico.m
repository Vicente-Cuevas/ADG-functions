function [Periodo,Amplitud,Fase,A,B]=anarmonico(DATA,T)
%%
t=1:length(DATA);
media=mean(DATA);
DATA=DATA-media;
w=2*pi/T;
c=cos(w.*t');
s=sin(w.*t');
cc=sum(c.*c);
cs=sum(c.*s);
sc=sum(s.*c);
ss=sum(s.*s);
cy=sum(c.*DATA);
sy=sum(s.*DATA);

%%

A=(cy*ss-sy*cs)/(cc*ss-sc*cs);
B=(cc*sy-sc*cy)/(cc*ss-sc*cs);

%%

Periodo=T;
Amplitud=sqrt(A^2+B^2);
Fase=atan2(A,B);
