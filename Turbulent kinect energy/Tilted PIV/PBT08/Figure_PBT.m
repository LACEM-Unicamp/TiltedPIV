%Normalized turbulent kinetic energy obtained from Stereo-PIV measurements  
%considering all three root-mean-square of the velocity fluctuations
%for different blade angles of PBT.
%--------------------------------------------------------------------------
%Options to save figures (0 = do not save, 1 = save)
%--------------------------------------------------------------------------
save_tif = 1; % in .tif
save_svg = 1; % in .svg
%--------------------------------------------------------------------------
%Tank and impeller properties
%--------------------------------------------------------------------------
global R H U_tip
RPM = 480;      % rotation speed (rpm)
N = RPM/60;     % rotation speed (rev/s)
D = 152*10^-3;  % impeller diameter (m)
H = 380;        % tank height (mm)
R = 190;        % tank radius (mm)

U_tip = pi*D*N; %impeller tip velocity (m/s)
%--------------------------------------------------------------------------
%Field properties
%--------------------------------------------------------------------------
global dxe dye
dxe = 47.25;  
dye = 124.5;

global lim_min_x lim_max_x lim_min_y lim_max_y
lim_min_x = 0.056;      % min limit of x in fields
lim_max_x = 0.48;     % max limit of x in fields 

lim_min_y = 0.1782;     % min limit of y in fields 
lim_max_y = 0.39;       % max limit of y in fields
%-------------------------------------------------------------------------- 
%Figure parameters
%-------------------------------------------------------------------------- 
FontStyle %set Times New Roman, size 14 as font style

impeller = 'PBT4508';
angle = {'0', '22_5', '45', '67_5'};
tec = 'PIV';
cam = 'Cam 1';
pass = '4';
parameter = 'tke';
met = {'iso', '2C'};

cmin = 0.0;
cmax = 0.12;
showtt = 1;
showimpeller = 1;
%-------------------------------------------------------------------------- 
%Set Figure
%--------------------------------------------------------------------------
figure(1);
set(figure(1),'Position',[50 50 800 400]);
layout = tiledlayout(2,4);
layout.OuterPosition = [0 0 0.95 0.95];

for a = 1: length (met)
    for i = 1:length(angle)
        nexttile
        [var_e,var_x,var_y] = Reader_tke(impeller,angle{i},tec,cam,pass,met{a});

        if (i == 1) && (a == length(met))         
            Graph_PBT(var_x, var_y, var_e, 1, 1, cmax, cmin, 0, angle{i}, showimpeller, tec, cam)
            text (-0.25,0.45,'(b)','fontweight','bold')
        elseif i == 1
            Graph_PBT(var_x, var_y, var_e, 0, 1, cmax, cmin, showtt, angle{i}, showimpeller, tec, cam)
            text (-0.25,0.45,'(a)','fontweight','bold')
        elseif a == 1
            Graph_PBT(var_x, var_y, var_e, 0, 0, cmax, cmin, showtt, angle{i}, showimpeller, tec, cam)   
        elseif a == length(met)
            Graph_PBT(var_x, var_y, var_e, 1, 0, cmax, cmin, 0, angle{i}, showimpeller, tec, cam)    
        else
            Graph_PBT(var_x, var_y, var_e, 0, 0, cmax, cmin, 0, angle{i}, showimpeller, tec, cam)
        end 
    end
end

Set_colorbar(cmin, cmax, '')

Save(save_tif, save_svg, impeller, parameter, '')