function P = coheren(x,y,m,noverlap)
% function P = coheren(x,y,m,noverlap)
% Power spectral densitie estimation of two data sequences.
% P = coheren(x,y,m,noverlap) performs FFT analysis of the two sequences
% X and Y using the Welch method of power spectrum densitie estimation. 
% The X and Y sequences of N points are divided into K sections of M
% points each. Using an M-point FFT, successive sections are Hanning
% windowed, FFT'd and accumulated.
%
%  Input:
%    x,y       vector con series de tiempo
%    m         longitud del segmento
%    noverlap  numero de datos a superponer
%
% Output:
%         P = [Fs Pxx Pyy Cxy Fxy]
%  where:
%         Fs        Frequency
%         Pxx       Power spectral density of  x
%         Pyy       Power spectral density of  y
%         Cxy       Coherence squared between x and y
%         Fxy       Phase in degree
%

x = x(:);               % Make sure x and y are column vectors
y = y(:);
n = max(size(x));       % Number of data points
k = fix(n/m);           % Number of windows (numero de trozos)
index = 1:m;
w = hanning(m);         % Window specification; change this if you want:
			            % (Try HAMMING, BLACKMAN, BARTLETT, or your own)
KMU = k*m*norm(w)^2/2;  % Normalizing scale factor

Pxx = zeros(m,1);
Pyy = Pxx; Pxy = Pxx;
for i=1:k
	xw = w.*detrend(x(index));
	yw = w.*detrend(y(index));
	index = index + (m - noverlap);
	Xx = fft(xw);
	Yy = fft(yw);
	Pxx = Pxx + abs(Xx).^2;
	Pyy = Pyy + abs(Yy).^2;
	Pxy = Pxy + Yy.*conj(Xx);
end

    nx = length(Pxx(:,1));
    k = [1:fix(nx/2)];
    k = [0., k, -k(fix((nx-1)/2):-1:1)]';
    Fs = k/m; % Frecuencia

    Cxy = (abs(Pxy).^2)./(Pxx.*Pyy); % Coherencia cuadrada
    Fxy = angle(Pxy)*180/pi;         % Fase en grados

    PPxx = Pxx/(Fs(2)-Fs(1));        % Densidad espectral
    PPyy = Pyy/(Fs(2)-Fs(1));        % Densidad espectral
 
    P = [Fs [PPxx PPyy]/KMU Cxy Fxy];
    P = P(1:fix(nx/2)+1,:);           % Toma solo la mitad del espectro
  
  
 
 