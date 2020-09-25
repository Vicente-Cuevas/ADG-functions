function [R,psi,coef_a,coef_b] = coef_circular_inversa(f,data)
w = (2*pi)*f;
N = length(data);
sum1 = 0;
sum2 = 0;
sum3 = 0;
sum4 = 0;
sum5 = 0;
for t = 1:N;
     sum1 = sum1 + data(t)*cos(w*t);
     sum2 = sum2 + sin(w*t)^2;
     sum3 = sum3 + data(t)*sin(w*t);
     sum4 = sum4 + cos(w*t)*sin(w*t);
     sum5 = sum5 + cos(w*t)^2;
end  
A = [sum5 sum4 ; sum4 sum2];
B = [sum1 ; sum3];
A_inv = inv(A);
C = A_inv*B;

coef_a = C(1,1);
coef_b = C(2,1);

R = sqrt(coef_a^2 + coef_b^2);
psi = -atan2(coef_b,coef_a);