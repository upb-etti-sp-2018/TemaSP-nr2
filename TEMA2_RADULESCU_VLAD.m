P=40;
f=1/P;
t=-2*P:0.002:2*P;
D=1/2;
N=50;
ci = ( 1+sawtooth ( 2*pi*f*t,D ) )/2;
p0 = @(t)( 1+sawtooth ( 2*pi*f*t,D ) )/2;
cc = 1/P*integral(p0,0,P);
Ck = zeros(1,N);
Ak = zeros(1,N);
xr = 0;
for(a=1:1:N)
   p1 = @(t)( 1+sawtooth( 2*pi*f*t,D ) )/2.*exp( -2*pi*f*t*1j*(a-25) );
   Ck(a) = 1/P*integral(p1,0,P);
   Ak(a+1) = 2*abs( Ck(a) );
   xr = xr+Ck(a)*exp( 2*pi*f*t*1j*(a-25) );
end
figure(1);
plot(t,xr,t,ci,'g');
figure(2);
Ak(26)=abs(cc);
Ak(1)=Ak(51);
stem([0:N],Ak,'y');
%Din cursul de SS, teoria seriilor trigonometrice, armonice si complexe Fourier ne 
%prezinta ca orice semnal periodic poate fi aproximat printr o suma algebrica de 
%functii sinus ,dar si cosinus de frecvente diferite ,fiecare ponderat de un anumit 
%coeficient. Acesti coeficienti reprezinta amplitudinea pentru anumite frecvente.
%Semnalul reconstruit are la baza un numar finit de termeni si are o forma aproape 
%identica cu semnalul original, insa exista o marja de eroare. Cu cat crestem nr 
%de coeficienti ai seriei Fourie, aceasta marja de eroare se va micsora. Putem observa 
%ca semnalul poate fii aproximat printr o suma de functii sinus , variatiile semnalului 
%avand caracter sinusoidal