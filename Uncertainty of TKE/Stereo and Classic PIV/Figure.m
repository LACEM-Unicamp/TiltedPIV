%Uncertainty of TKE obtained from Stereo-PIV measurements 
%at different blade angles of (a) Rushton turbine and (b) PBT.
%--------------------------------------------------------------------------
%Options to save figures (0 = do not save, 1 = save)
%--------------------------------------------------------------------------
save_tif = 0; % in .tif
save_svg = 0; % in .svg
%--------------------------------------------------------------------------
%Tank and impeller properties
%--------------------------------------------------------------------------
global H R U_tip
%Rushton
RPM_ru = 240;      % rotation speed (rpm)
N_ru = RPM_ru/60;     % rotation speed (rev/s)
D_ru = 152*10^-3;  % impeller diameter (m)
U_tip_ru = pi*D_ru*N_ru; %impeller tip velocity (m/s)

%PBT
RPM_pbt = 480;      % rotation speed (rpm)
N_pbt = RPM_pbt/60;     % rotation speed (rev/s)
D_pbt = 152*10^-3;  % impeller diameter (m)
U_tip_pbt = pi*D_pbt*N_pbt; %impeller tip velocity (m/s)

H = 380;        % tank height (mm)
R = 190;        % tank radius (mm)
%--------------------------------------------------------------------------
%Field properties
%--------------------------------------------------------------------------
global dxe dye lim_min_x lim_max_x lim_min_y lim_max_y
%Rushton
dxe_ru = 46.05;  
dye_ru = 136;
lim_min_x_ru = 0.056;  % min limit of x in graphs 
lim_max_x_ru = 0.5149; % max limit of x in graphs 
lim_min_y_ru = 0.2091; % min limit of y in graphs 
lim_max_y_ru = 0.42;   % max limit of y in graphs

%PBT
dxe_pbt = 47.25;  
dye_pbt = 124.5;
lim_min_x_pbt = 0.056;  % min limit of x in graphs 
lim_max_x_pbt = 0.5149; % max limit of x in graphs 
lim_min_y_pbt = 0.1782; % min limit of y in graphs 
lim_max_y_pbt = 0.39;   % max limit of y in graphs
%-------------------------------------------------------------------------- 
%Figure parameters
%-------------------------------------------------------------------------- 
FontStyle %set Times New Roman, size 14 as font style
impeller = {'RUSHTON08','PBT4508'};
AR_RU = {'0','15','30','45'};
AR_PBT = {'0','22_5','45','67_5'};

tec = 'SPIV';
cam = '';
pass = '4';
parameter = 'uncertainty_tke';
met = '3C';

cmin = 0.0;
cmax = 0.004;
showimpeller = 1;
showtt = 1;
line_title = {'(a)', '(b)'};

%-------------------------------------------------------------------------- 
%Set Figure
%--------------------------------------------------------------------------
figure(1);
set(figure(1),'Position',[50 50 800 400]);
layout = tiledlayout(2,4);
layout.OuterPosition = [0 0 0.95 0.95];

for i = 1:length(impeller)
    if strcmp(impeller{i},'RUSHTON08') == 1
        angle = AR_RU;
        U_tip = U_tip_ru;
        dxe = dxe_ru;
        dye = dye_ru;
        lim_min_x = lim_min_x_ru;
        lim_max_x = lim_max_x_ru;
        lim_min_y = lim_min_y_ru;
        lim_max_y = lim_max_y_ru;
    elseif strcmp(impeller{i},'PBT4508') == 1
        angle = AR_PBT;
        U_tip = U_tip_pbt;
        dxe = dxe_pbt;
        dye = dye_pbt;
        lim_min_x = lim_min_x_pbt;
        lim_max_x = lim_max_x_pbt;
        lim_min_y = lim_min_y_pbt;
        lim_max_y = lim_max_y_pbt;
    else
        error('invalid impeller')
    end
    
    for j = 1:length(angle)          
        nexttile
        [var_e,var_x,var_y] = Reader_uncertainty_tke(impeller{i}, angle{j}, tec, cam, pass, met);    
        
        if strcmp(impeller{i},'RUSHTON08')            
            Graph_RU(var_x,var_y,var_e,0,0,cmax,cmin,showtt,angle{j},showimpeller,tec,cam)
        elseif strcmp(impeller{i},'PBT4508')
            Graph_PBT(var_x,var_y,var_e,0,0,cmax,cmin,showtt,angle{j},showimpeller,tec,cam)
        else
            error('invalid impeller')
        end
        
        if j == 1
            ylabel('z/H')
            text (-0.23,0.45,line_title{i},'fontweight','bold')
        else
        end

        if i == length(impeller)
            xlabel('r/R')
        else
        end
        
    end
end

Set_colorbar(cmin, cmax, met)

Save(save_tif, save_svg, tec, parameter, met)