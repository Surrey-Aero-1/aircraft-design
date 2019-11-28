
Altitude = 0:500:8000;
a = [340.3,338.4,336.4,334.5,332.5,330.6,328.6,326.6,324.6,322.6,320.5,318.5,316.5,314.4,312.3,310.2,308.1];
%Data taken from steam table

Radius = [1:0.2941*2:12]*0.5;

V0 = 0.6.*a;%Cruising at 0.6M


Vtip = sqrt((0.9*a).^2 - V0.^2);%Max speed to ensure tip stays within 0.9 Mach

AngV1 = Vtip(1)./Radius;
AngV2 = Vtip(2)./Radius;
AngV3 = Vtip(3)./Radius;
AngV4 = Vtip(4)./Radius;
AngV5 = Vtip(5)./Radius;
AngV6 = Vtip(6)./Radius;
AngV7 = Vtip(7)./Radius;
AngV8 = Vtip(8)./Radius;
AngV9 = Vtip(9)./Radius;
AngV10 = Vtip(10)./Radius;
AngV11 = Vtip(11)./Radius;
AngV12 = Vtip(12)./Radius;
AngV13 = Vtip(13)./Radius;
AngV14 = Vtip(14)./Radius;
AngV15 = Vtip(15)./Radius;
AngV16 = Vtip(16)./Radius;
AngV17 = Vtip(17)./Radius;

figure (1)
plot(Radius,AngV1)
hold on
plot(Radius,AngV2)
hold on
plot(Radius,AngV3)
hold on
plot(Radius,AngV4)
hold on
plot(Radius,AngV5)
hold on
plot(Radius,AngV6)
hold on
plot(Radius,AngV7)
hold on
plot(Radius,AngV8)
hold on
plot(Radius,AngV9)
hold on
plot(Radius,AngV10)
hold on
plot(Radius,AngV11)
hold on
plot(Radius,AngV12)
hold on
plot(Radius,AngV13)
hold on
plot(Radius,AngV14)
hold on
plot(Radius,AngV15)
hold on
plot(Radius,AngV16)
hold on
plot(Radius,AngV17)


xlabel('Radius/m')
ylabel('Max Angular Velocity/ rad/s')
legend('0m','500m','1000m','1500m','2000m','2500m','3000m','3500m','4000m','4500m','5000m','5500m','6000m','6500m','7000m','7500m','8000m')
title('Max Prop Diameter and Angular Velocity for Altitudes ranging from 0m-8000m')

figure (2)
plot(Radius,AngV1)
hold on
plot(Radius,AngV13)
hold on
plot(Radius,AngV17)
xlabel('Radius/m')
ylabel('Max Angular Velocity/ rad/s')
legend('0m','6000m/20,000ft','8000m/26,000ft')
title('Max Prop Diameter and Angular Velocity for 0m,6000m,8000m')

figure (3)
rpm1 = 60*AngV1./(2*pi);
rpm13 = 60*AngV13./(2*pi);
rpm17 = 60*AngV17./(2*pi);

plot(Radius,rpm1)
hold on
plot(Radius,rpm13)
hold on
plot(Radius,rpm17)

xlabel('Radius/m')
ylabel('Max RPM')
legend('0m','6000m/20,000ft','8000m/26,000ft')
title('Max Prop Diameter and RPM for 0m,6000m,8000m')

%%
%Power Calculation Engine?

Thrust = 122.8*(10^3);
PropEff = 0.8;
V = 128;

PShaft = (Thrust*V*(1/3))/PropEff



