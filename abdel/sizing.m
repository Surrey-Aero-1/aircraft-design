close all
clear
clc

cpct = 7;
eta = 0.85;
T = 210e+3;

D = 3.5:0.01:5.5;
n = (4:8)';

Pstat = (1./3).*T.*cpct.*n.*D;

hold on
for i = 1:length(n)
    plot(D,Pstat(i,:)/1000);
end
xlabel('Propeller Diameter (m)');
ylabel('Takeoff Rating (kW)');
xlim([D(1) D(end)]);
ylim([Pstat(1) Pstat(end)]./1000);
legend(num2str(n));
