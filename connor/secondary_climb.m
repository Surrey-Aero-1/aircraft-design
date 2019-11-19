%only run this script when you want to change a parameter such as starting
%altitude or aircraft values as the script takes a long time to run
%use script 2 to graph the data and collect data such as energy expended

clc
clear
close

cd0 = [0.02];
%total aicraft coefficient of drag
wetted_area = 6.25*122.4;
%total wetted area of the aricraft
wing_span = [52];
weight = [5.824243164705882e+05];

%wing area does not affect cruise or climb equations 
thrust =  [400000];
% input values you want to test above, must be entered as column vectors
% the more values you test at one the longer the scrip will take
%thrust is in newtons, but as our aircraft is likely to be a turbo prop it
%should be converted into power in the future





altitude_interval_init = 100;
altitude = (0:altitude_interval_init:35000)*0.3048;
altitude_interval = altitude_interval_init * 0.3048;
%the smaller the altitude interval the more accurate the results, but the
%longer the script takes



pressure = 101325 * (1 - 0.0065 * altitude/288.15).^(9.81*0.0289654/(8.31447*0.0065));
T = 288.15 - altitude * 0.0065;
density = (pressure*0.0289654  ./ (T .* 8.31447));
%calculate air density at altitude
    
    
syms v b densityx thrustx  v(x) dragx(x) weightx cdx wetted_areax

dragx(x, densityx,b, weightx,cdx, wetted_areax) = weightx.^2./(b.^2.*pi.*x.^2.*densityx.*0.5) + (cdx .* 0.5 .* x.^2 .* wetted_areax .* densityx);
v(x, densityx, thrustx,b,weightx,cdx, wetted_areax) = ((thrustx .* densityx./1.225) - dragx(x, densityx,b,weightx,cdx, wetted_areax)) - x.*diff(dragx(x, densityx,b,weightx,cdx, wetted_areax),x) ==0;
place = 0;
climb_velocity = zeros(length(cd0)*length(wetted_area)*length(wing_span)*length(weight)*length(thrust),size(density,1));
for d = 1:size(density.',1)
       for t = 1:size(thrust.',1)
           for span = 1:size(wing_span.',1)              
               for w = 1:size(weight.',1)
                   for c = 1:size(cd0.',1)
                       for a = 1:size(wetted_area.',1)
                            velocity = (double(vpasolve((v(x, density(d), thrust(t),wing_span(span),weight(w),cd0(c), wetted_area(a))))));
                            velocity = (velocity(real(velocity)>0&imag(velocity)==0));
                            place = place + 1;
                            climb_velocity(place,d) = velocity; 
                            if altitude(d) < 10000*0.3048
                                if climb_velocity(place,d) > 129
                                    climb_velocity(place,d) = 129;
                                end
                            end
                                    
                       end
                   end
               
               end
           end
       end
       place = 0;
end


