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


altitude_interval_init = 10000;
altitude = (0:altitude_interval_init:35000)*0.3048;
altitude_interval = altitude_interval_init * 0.3048;
%the smaller the altitude interval the more accurate the results, but the
%longer the script takes


pressure = 101325 * (1 - 0.0065 * altitude/288.15).^(9.81*0.0289654/(8.31447*0.0065));
T = 288.15 - altitude * 0.0065;
density = (pressure*0.0289654  ./ (T .* 8.31447));
%calculate air density at altitude

syms   v(x) dragx(x) drag_diff(x) x densityx te(density)

dragx(x,densityx) = weight^2/(wing_span^2*pi.*x^2 *densityx*0.5) + (cd0 * 0.5 * x^2 * wetted_area * densityx);
drag_diff(x,densityx) = diff(dragx(x,densityx));
v(x,densityx) = (((thrust * densityx/1.225) - dragx(x,densityx)) - x*drag_diff(x,densityx)) ==0;

velocity = matlabFunction(v(x,densityx));

output = (solve(velocity(x,density)))


                                