clear
clc

T_max = 1228;

eta_ref = 0.85;
J_ref = 0.55;
C_T = 0.147;
C_P = 0.11;

rho = 1.225;

P = 2000:8000;

%D_2 = ((C_T./C_P).*P)./(T_max.*n');
%D_4 = (3/4).*((C_T./C_P).*P)./(T_max.*n');

h_ft = [0, 400, 1500, 10000, 15000, 20000]';

%D_2 = sqrt((2.*T_max.^3)./((P.*eta_ref).^2.*rho.*pi()));
D_2 = (1/2).*sqrt(2./pi()).*T_max.^(3/2)./((P.*eta_ref).*sqrt(rho));
D_4 = (1/4).*sqrt(2./pi()).*T_max.^(3/2)./((P.*eta_ref).*sqrt(rho));
D_2_oei = sqrt(2./pi()).*T_max.^(3/2)./((P.*eta_ref).*sqrt(rho));
D_4_oei = (1/3).*sqrt(2./pi()).*T_max.^(3/2)./((P.*eta_ref).*sqrt(rho));
%A = pi().*(4.^2)./4;
%F = (3700.*10^3).^(2/3).*(2.*rho.*A).^(1/3)
[temp,pressure,rho_alt] = atm(h_ft./3.281);
D_choice = 4;
P_alt = (sqrt(2/pi()).*T_max./4.*sqrt((T_max.*(D_choice.^2.*rho_alt).^(2/3))./(D_choice.^2.*rho_alt)))./(eta_ref.*(D_choice.^2.*rho_alt).^(1/3));
%T_alt = P.^(2/3).*(2.*rho_alt.*(pi().*D_2.^2./4)).^(1/3).*eta_ref;

%n = ((C_T./C_P).*P)./(T_max.*D_2);

hold on
plot(P,D_2);
plot(P,D_4);
plot(P,D_2_oei);
plot(P,D_4_oei);
%title('Minimum Power and Diameter Requirements For Single Engine');
xlabel('Power (kW)');
ylabel('Prop Diameter (m)');
legend('2 Engines','4 Engines','2 Engines OEI','4 Engines OEI');
hold off