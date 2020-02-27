close all
clear
clc

gamma = 1.4;
R = 287;
g = 9.81;

alt = 20000.*0.3048;
[T,P,rho] = atm(alt);
c = sqrt(gamma.*R.*T);

V_th_max = 1.*c;

rpm = 1000; %assumption
D = 2:0.01:6;
V_plane = sqrt(V_th_max.^2 - ((pi()/30).*rpm.*(D./2)).^2).*1.944;

targetVel = 0.6.*c.*1.944;
absVel = 0.75.*c.*1.944;

hold on
plot(D,V_plane);
tV = ['y<' num2str(targetVel)];
aV = ['y>' num2str(absVel)];
ineqplot(tV,[D(1) D(end) V_plane(end) V_plane(1)],'r');
ineqplot(aV,[D(1) D(end) V_plane(end) V_plane(1)],'b');

xlabel('Prop Diameter (m)');
ylabel('Max Aircraft Speed (knts)');