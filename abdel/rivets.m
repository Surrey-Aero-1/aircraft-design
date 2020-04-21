clear
clc

P = 140*1.5*9.81; %max load on wing
Eb = 113.8; %GPa
sigmab = 0.88; %GPa
Em = 141; %GPa
AD = 201.06;
AT = 156.67;

kb = Eb .* (AD.*AT)./(AD.*60 + AT.*35);

kmf = pi() .* Em .* (20.^2 - 16.^2) ./ (4 .* 73);
kmr = pi() .* Em .* (20.^2 - 16.^2) ./ (4 .* 40);

n = 0.2.*sigmab.*AT.*(((kmf+kb)./kb)+((kmr+kb)./kb))*(P./2);