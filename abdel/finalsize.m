clear
clc

gamma = 1.4;
R = 287;
g = 9.81;

alt = 20000.*0.3048;
[T,P,rho] = atm(alt);
c = sqrt(gamma.*R.*T);

Vt = 0.95.*c;
Vm = 0.6.*c;
rpm = 1000;

ang = 0:0.05:30;

D = sqrt(((Vt./cosd(ang)).^2 - Vm.^2)./(pi().*rpm./60).^2);
plot(ang,D);