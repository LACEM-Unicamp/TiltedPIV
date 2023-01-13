%Root-mean-square of radial velocity fluctuations obtained from
%classic PIV, tilted PIV and Stereo-PIV measurements
%at different blade angles of Rushton turbine.
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
lim_max_x = 0.5149;     % max limit of x in fields 

lim_min_y = 0.1782;     % min limit of y in fields 
lim_max_y = 0.39;       % max limit of y in fields
%-------------------------------------------------------------------------- 
%Figure parameters
%-------------------------------------------------------------------------- 
FontStyle %set Times New Roman, size 14 as font style

impeller = 'PBT4508';
angle = {'0', '22_5', '45', '67_5'};
angle_title = {'AR 0º', 'AR 22.5º', 'AR 45º', 'AR 67.5º'};
tec = 'SPIV';
cam = '';
column_title = {'(a)', '(b)', '(c)'};
pass = '4';
parameter = 'contribution_rms';
component = {'radial', 'axial', 'tangential'};

cmin = 0;
cmax = 100;
showimpeller = 1;
%-------------------------------------------------------------------------- 
%Set Figure
%--------------------------------------------------------------------------
figure(1);
set(figure(1),'Position',[50 50 650 800]);
layout = tiledlayout(4,3);
layout.OuterPosition = [0 0 0.93 0.93];

for i = 1:length(angle)
    for j = 1:length(component)
        nexttile
        [var_e,var_x,var_y] = Reader_contribution_rms(impeller,angle{i},tec,pass,component{j});
        
        if i == 1            
            Graph_PBT(var_x,var_y,var_e,0,0,cmax,cmin,0,angle{i},showimpeller,tec,cam)
            title(column_title{j},'FontWeight','bold')
            ax=gca;
            ax.TitleHorizontalAlignment = 'left';
        elseif i == length(angle)
            Graph_PBT(var_x,var_y,var_e,1,0,cmax,cmin,0,angle{i},showimpeller,tec,cam)
        else
            Graph_PBT(var_x,var_y,var_e,0,0,cmax,cmin,0,angle{i},showimpeller,tec,cam)
        end
        
        if j == 1
            ylabel('z/H')
            text(-0.16,(lim_max_y + lim_min_y)/2,angle_title{i},'fontweight','bold','Rotation',90,'HorizontalAlignment','Center')
        else
        end
        
    end
end

Set_colorbar(cmin, cmax)

Save(save_tif, save_svg, impeller, parameter,'')