%Normalized turbulent kinetic energy obtained from Stereo-PIV measurements  
%considering all three root-mean-square of the velocity fluctuations
%for different blade angles of Rushton turbine.
%--------------------------------------------------------------------------
%Options to save figures (0 = do not save, 1 = save)
%--------------------------------------------------------------------------
save_tif = 1; % in .tif
save_svg = 1; % in .svg
%--------------------------------------------------------------------------
%Tank and impeller properties
%--------------------------------------------------------------------------
global R H U_tip
RPM = 240;      % rotation speed (rpm)
N = RPM/60;     % rotation speed (rev/s)
D = 152*10^-3;  % impeller diameter (m)
H = 380;        % tank height (mm)
R = 190;        % tank radius (mm)

U_tip = pi*D*N; %impeller tip velocity (m/s)
%--------------------------------------------------------------------------
%Field properties
%--------------------------------------------------------------------------
global dxe dye
dxe = 46.05;  
dye = 136;

global lim_min_x lim_max_x lim_min_y lim_max_y
lim_min_x = 0.056;      % min limit of x in fields
lim_max_x = 0.5149;     % max limit of x in fields 

lim_min_y = 0.2091;     % min limit of y in fields 
lim_max_y = 0.42;       % max limit of y in fields
%-------------------------------------------------------------------------- 
%Figure parameters
%-------------------------------------------------------------------------- 
FontStyle %set Times New Roman, size 14 as font style

impeller = 'RUSHTON08';
angle = {'0', '15', '30', '45'};
angle_title = {'AR 0º', 'AR 15º', 'AR 30º', 'AR 45º'};
tec = 'SPIV';
cam = '';
pass = '4';
parameter = 'tke';
component = '';
met = '3C';

cmin = 0.0;
cmax = 0.2;
showtt = 1;
showimpeller = 1;
%-------------------------------------------------------------------------- 
%Set Figure
%--------------------------------------------------------------------------
figure(1);
set(figure(1),'Position',[50 50 800 200]);
layout = tiledlayout(1,4);
layout.OuterPosition = [0 0 0.95 0.95];

for i = 1:length(angle)
    nexttile
    [var_e,var_x,var_y] = Reader_tke(impeller,angle{i},tec,cam,pass,met);
       
    if i == 1            
        Graph_RU(var_x,var_y,var_e,1,1,cmax,cmin,showtt,angle{i},showimpeller,tec,cam)
    else
        Graph_RU(var_x,var_y,var_e,1,0,cmax,cmin,showtt,angle{i},showimpeller,tec,cam)
    end
     
end


Set_colorbar(cmin, cmax, met)

Save(save_tif, save_svg, impeller, parameter,met)