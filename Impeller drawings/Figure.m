%Raw images from cameras at diferent blade angles
%--------------------------------------------------------------------------
%Saving status
%--------------------------------------------------------------------------
save_tif = 1; % in .tif
save_svg = 1; % in .svg
%--------------------------------------------------------------------------
%Impellers Parameters
%--------------------------------------------------------------------------
global R H dxe dye lim_min_x lim_max_x lim_min_y lim_max_y
H = 380;       % tank height (mm)
R = 190;       % tank radius (mm)

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
lim_max_x_pbt = 0.48; % max limit of x in graphs 
lim_min_y_pbt = 0.17; % min limit of y in graphs 
lim_max_y_pbt = 0.39;   % max limit of y in graphs
%--------------------------------------------------------------------------
%Font style
%--------------------------------------------------------------------------
FontStyle
%--------------------------------------------------------------------------
%Figure parameters
%--------------------------------------------------------------------------
% impeller = {'RUSHTON08','PBT4508'};
AR_RU = {'0','15','30','45'};
AR_PBT = {'0','22_5','45','67_5'};
cam = {'Cam 1','Cam 2'};
angle_label_RU = {'AR 0º','AR 15º','AR 30º','AR 45º'};
angle_label_PBT = {'AR 0º','AR 22.5º','AR 45º','AR 67.5º'};
title_col = {'Camera 1', 'Camera 2'};

impeller = 'RUSHTON08';
tec = 'PIV';
pass = '3';
met = 'SNR';
cmin = 1;
cmax = 4;

if strcmp(impeller,'RUSHTON08') == 1
    AR = AR_RU;
    angle_label = angle_label_RU;
    dxe = dxe_ru;
    dye = dye_ru;
    lim_min_x = lim_min_x_ru;
    lim_max_x = lim_max_x_ru;
    lim_min_y = lim_min_y_ru;
    lim_max_y = lim_max_y_ru;
elseif strcmp(impeller,'PBT4508') == 1
    AR = AR_PBT;
    angle_label = angle_label_PBT;
    dxe = dxe_pbt;
    dye = dye_pbt;
    lim_min_x = lim_min_x_pbt;
    lim_max_x = lim_max_x_pbt;
    lim_min_y = lim_min_y_pbt;
    lim_max_y = lim_max_y_pbt;
else
    error('invalid impeller')
end
%--------------------------------------------------------------------------
%Set figure
%--------------------------------------------------------------------------   
figure(1)
set(figure(1),'Position',[50 50 600 900])
layout = tiledlayout(4,2);
layout.OuterPosition = [0 0 0.98 0.98];
layout.TileSpacing = 'compact';

for a = 1:length(AR)
    for b = 1:length(cam)
    nexttile
    [var_e,var_x,var_y] = Reader_method(impeller,AR{a},tec,cam{b},pass,met);
 
        if a == 1
            xlb = 0;
            ylb = 0;
            Graph(var_x,var_y,var_e,0,'',xlb,ylb,cmax,cmin)
            draw_impeller(impeller,AR{a},cam{b})
            title(title_col{b})
        elseif a == length(AR)
            xlb = 1;
            ylb = 0;
            Graph(var_x,var_y,var_e,0,'',xlb,ylb,cmax,cmin)
            draw_impeller(impeller,AR{a},cam{b})       
        else            
            xlb = 0;
            ylb = 0;
            Graph(var_x,var_y,var_e,0,'',xlb,ylb,cmax,cmin)
            draw_impeller(impeller,AR{a},cam{b})
        end
        
        if b == 1
           ylabel(angle_label{a})
        else
        end
    end
end

Save(save_tif, save_svg, impeller)



