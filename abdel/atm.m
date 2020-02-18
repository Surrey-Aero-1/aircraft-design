function [T,p,rho] = atm(h)

    T0 = 288.15;
    p0 = 1.013;
    rho0 = 1.225;
    lambda = 6.5;
    g = 9.81;
    R = 287;
    hStrat = 11e+3;
   
    
    for i = 1:length(h)
        if h < hStrat
            T(i) = T0 - lambda.*(h(i)./1000);
            p(i) = p0.*(T(i)./T0).^(g./(R.*lambda));
        else
            T(i) = 216.65;
            p1 = p0.*(T(i)./T0).^(g./(R.*lambda));
            p(i) = p1.*exp((-g./(R.*T(i))).*(hStrat-h(i)));
        end
    end
    rho = p./(R.*T)*100000;

end

