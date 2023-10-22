clear all;
close all;
clc;
alpha1 = 0.125;
alpha3 = 0.8;%smolyakow书里的参数
ufree = 10;
uc= 0.7.*ufree;
uc = 10;
f=0:10:5000;
R = 0.003;
f = 0;
f_range = 0:10:5000;
for f = 0:10:5000
    w = 2.*pi.*f.*2.*R./uc;
%     x = 2.*pi.*f.*R./uc;
    fun = @(x1,x3) 32./(pi.^2) .* exp(-alpha1.*w.*x1) .* cos(w.*x1) .* exp(-alpha3.*w.*x3) .* (acos((x1.^2+x3.^2).^(1./2)) - (x1.^2+x3.^2).^(1./2).*(1-(x1.^2+x3.^2)).^(1./2));
    x3max = @(x1) (1-x1.^2).^(1./2);
    q = integral2(fun,0,1,0,x3max);
    ratio(f/10+1) = q;
end
figure;
plot(f_range,ratio);
title('circular sensor')
xlabel('frequency(Hz)')
ylabel('attenuation ratio')
ylim([0,1])

corcos_x = 2 *pi .* f_range * R / uc;
figure;
plot(corcos_x,ratio);
title('circular sensor')
xlabel('corcos x')
ylabel('attenuation ratio')
ylim([0,1])
