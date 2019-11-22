function [T,p,rho] = atm(h)

    T0 = 288.15;
    p0 = 1.013;
    rho0 = 1.225;
    lambda = 6.5;
    g = 9.81;
    R = 287;
    hStrat = 11e+3;
    
    if h < hStrat
        T = T0 - lambda.*(h./1000);
        p = p0.*(T./T0).^(g./(R.*lambda));
    else
        T = 216.65;
        p1 = p0.*(T./T0).^(g./(R.*lambda));
        p = p1.*exp((-g./(R.*T)).*(hStrat-h));
    end
    
    rho = p./(R.*T)*100000;

end

