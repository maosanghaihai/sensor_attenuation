clear all;
close all;
clc;
alpha1 = 0.125;%0.09
alpha3 = 7*alpha1;
ufree = 10;
f=0:1:5000;
L1 = 0.015;
L3 = 0.01;
uc = 0.7*ufree;
w1 = 2*pi*f*L1/uc;
w3 = 2*pi*f*L3/uc;
APART1 = 2/(1+alpha1^2).*(1./w1.^2);
APART2 = (1-alpha1^2)/(1+alpha1^2);
APART3 = alpha1.*w1;
APART4 = exp(-alpha1.*w1);
APART5 = 2*alpha1/(1+alpha1^2)*sin(w1)+(1-alpha1^2)/(1+alpha1^2)*cos(w1);
A = APART1.*(APART2+APART3-APART4.*APART5);
BPART1 = 2./(alpha3^2.*w3.^2);
BPART2 = alpha3.*w3+exp(-alpha3.*w3)-1;
B = BPART1.*BPART2;
X = A.*B;
figure;
plot(f,X);
title('rectangular sensor')
xlabel('frequency(Hz)')
ylabel('attenuation ratio')

corcos_x = 2 *pi .* f * L1 / uc;
figure;
plot(corcos_x,X);
title('rectangular sensor')
xlabel('corcos x')
ylabel('attenuation ratio')