%Relative percentage of the absolute difference between the TKE values 
%obtained from PIV measurements for different blade angles 
%--------------------------------------------------------------------------
%Options to save figures (0 = do not save, 1 = save)
%--------------------------------------------------------------------------
save_tif = 1; % in .tif
save_svg = 1; % in .svg
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

impeller = 'RUSHTON08';
AR_RU = {'0','15','30','45'};
angle_label_RU = {'AR 0??','AR 15??','AR 30??','AR 45??'};
AR_PBT = {'0','22_5','45','67_5'};
angle_label_PBT = {'AR 0??','AR 22.5??','AR 45??','AR 67.5??'};

tec = 'SPIV';
cam = 'Cam 2';
pass = '4';
parameter = 'difftke_stereo_piv';
met_cam2 = 'iso';
met_cam1 = {'iso','2C'};

cmin = 0;
cmax = 100;
showimpeller = 1;
showtt = 0;
line_title = {'(a)', '(b)'};

%-------------------------------------------------------------------------- 
%Set Figure
%--------------------------------------------------------------------------
if strcmp(cam,'Cam 2') == 1
    figure(1);
    set(figure(1),'Position',[50 50 800 200]);
    layout = tiledlayout(1,4);
    layout.OuterPosition = [0 0 0.93 0.95];
   
        if strcmp(impeller,'RUSHTON08') == 1
            angle = AR_RU;
            angle_title = angle_label_RU;
            U_tip = U_tip_ru;
            dxe = dxe_ru;
            dye = dye_ru;
            lim_min_x = lim_min_x_ru;
            lim_max_x = lim_max_x_ru;
            lim_min_y = lim_min_y_ru;
            lim_max_y = lim_max_y_ru;
        elseif strcmp(impeller,'PBT4508') == 1
            angle = AR_PBT;
            angle_title = angle_label_PBT;
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
            [var_e,var_x,var_y] = Reader_difftke_stereo_piv(impeller, angle{j}, cam, pass, met_cam2);    
            
            if strcmp(impeller,'RUSHTON08')            
                Graph_RU(var_x,var_y,var_e,1,0,cmax,cmin,1,angle{j},showimpeller,tec,cam)
            elseif strcmp(impeller,'PBT4508')
                Graph_PBT(var_x,var_y,var_e,1,0,cmax,cmin,1,angle{j},showimpeller,tec,cam)
            else
                error('invalid impeller')
            end
            
            if j == 1
                ylabel('z/H')
            else
            end
        end

        Set_colorbar(cmin, cmax, met_cam2)

elseif strcmp(cam,'Cam 1') == 1
    figure(1);
    set(figure(1),'Position',[50 50 800 400]);
    layout = tiledlayout(2,4);
    layout.OuterPosition = [0 0 0.95 0.95];

    for i = 1:length(met_cam1)
    if strcmp(impeller,'RUSHTON08') == 1
        angle = AR_RU;
        angle_title = angle_label_RU;
        U_tip = U_tip_ru;
        dxe = dxe_ru;
        dye = dye_ru;
        lim_min_x = lim_min_x_ru;
        lim_max_x = lim_max_x_ru;
        lim_min_y = lim_min_y_ru;
        lim_max_y = lim_max_y_ru;
    elseif strcmp(impeller,'PBT4508') == 1
        angle = AR_PBT;
        angle_title = angle_label_PBT;
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
        if strcmp(parameter,'difftke_stereo_piv')
            [var_e,var_x,var_y] = Reader_difftke_stereo_piv(impeller, angle{j}, cam, pass, met_cam1{i});
        elseif strcmp(parameter,'difftke_classic_tilted')
            [var_e,var_x,var_y] = Reader_difftke_classic_tilted(impeller, angle{j}, cam, pass, met_cam1{i});
        else
            error('invalid parameter')
        end
        
        if strcmp(impeller,'RUSHTON08')            
            Graph_RU(var_x,var_y,var_e,0,0,cmax,cmin,showtt,angle{j},showimpeller,tec,cam)
        elseif strcmp(impeller,'PBT4508')
            Graph_PBT(var_x,var_y,var_e,0,0,cmax,cmin,showtt,angle{j},showimpeller,tec,cam)
        else
            error('invalid impeller')
        end
        
        if j == 1
            ylabel('z/H')
            text (-0.23,0.45,line_title{i},'fontweight','bold')
        else
        end

        if i == 1
            title(angle_title{j},'FontWeight','bold')
        elseif i == length(met_cam1)
            xlabel('r/R')
        else
        end
        
    end
    end

    Set_colorbar(cmin, cmax, parameter)

else
    error('invalid camera')
end

Save(save_tif, save_svg, impeller, parameter, cam)