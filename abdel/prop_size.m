clear
clc

T_max = 144.*10^3;

eta_ref = 0.85;
J_ref = 0.55;
C_T = 0.147;
C_P = 0.11;

rho = 1.225;

P = 3000*10^3:5000*10^3;

%D_2 = ((C_T./C_P).*P)./(T_max.*n');
%D_4 = (3/4).*((C_T./C_P).*P)./(T_max.*n');

D_2 = sqrt((2.*T_max)./(P.^2.*rho.*eta_ref.^3));

n = ((C_T./C_P).*P)./(T_max.*D_2);

hold on
%for i = 1:length(n)
plot(P,D_2);
%end
xlabel('Takeoff Rating (kW)');
ylabel('Prop Diameter (m)');