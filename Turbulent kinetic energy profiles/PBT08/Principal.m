%Comparison among turbulent kinetic energy profiles
%--------------------------------------------------------------------------
%Saving status
%--------------------------------------------------------------------------
save_tif = 1; % in .tif
save_svg = 1; % in .svg
%--------------------------------------------------------------------------
%Font style
%--------------------------------------------------------------------------
FontStyle
%--------------------------------------------------------------------------
%Global configurations
%--------------------------------------------------------------------------
global dxe dye R H U_tip

dxe = 47.25;  
dye = 124.5;

H = 380;       % tank height (mm)
R = 190;       % tank radius (mm)

RPM = 480;     % rotation speed (rpm)
N = RPM/60;    % rotation speed (rps)
D = 152*10^-3; % impeller diameter (m)
%--------------------------------------------------------------------------
%Tip velocity
U_tip = pi*D*N;     % m/s
%--------------------------------------------------------------------------
%Figure definitions
%--------------------------------------------------------------------------
pass = '4'; % processing pass
angle = {'0', '22_5', '45', '67_5'};
AR = {'AR 0º', 'AR 22.5º', 'AR 45º', 'AR 67.5º'};
met_PIV = {'iso',  '2C'};
met_SPIV = {'3C'}; 
tec = {'PIV', 'SPIV'};
cam = {'Cam 1', 'Cam 2'};
horizontal = {'z/H = 0.38', 'z/H = 0.34', 'z/H = 0.28', 'z/H = 0.23'}; %position of the profiles in the horizontal direction
start_x_H = {0.057, 0.057, 0.057, 0.057};
start_y_H = {0.38, 0.34, 0.28, 0.23};
lim_min_y = 0.025;
lim_max_y = 0.14;

impeller = 'PBT4508';
parameter = 'tke_profile';

figure(1);
set(figure(1),'Position',[50 50 850 800]);
layout = tiledlayout(4, 4);
tilespacing = 'tight';
        
for a = 1:length(horizontal)
    for b = 1:length(angle)
        nexttile
        
        hold on
        impeller_limits(a,angle{b})
        hold off
                
        hold on    
        tec = 'SPIV';
        cam = '';
        met_PIV = '3C';
        [var, var_x, var_y] = Reader_method('PBT4508', angle{b}, tec, cam, pass, met_PIV);
        [lx, outx]=lineH(start_x_H{a}, start_y_H{a}, var_x, var_y, var);
        [lx_final, outx_final] = Cleaning (lx, outx);
        scatter(lx_final, outx_final, 15, 'filled')
               
        tec = 'PIV';
        cam = 'Cam 2';
        met_PIV = 'iso';
        [var, var_x, var_y] = Reader_method('PBT4508', angle{b}, tec, cam, pass, met_PIV);
        [lx, outx]=lineH(start_x_H{a}, start_y_H{a}, var_x, var_y, var);
        [lx_final, outx_final] = Cleaning (lx, outx);
        scatter(lx_final, outx_final, 15, 'filled','square')        
       
        tec = 'PIV';
        cam = 'Cam 1';
        met_PIV = '2C';
        [var, var_x, var_y] = Reader_method('PBT4508', angle{b}, tec, cam, pass, met_PIV);
        [lx, outx]=lineH(start_x_H{a}, start_y_H{a}, var_x, var_y, var);
        [lx_final, outx_final] = Cleaning (lx, outx);
        scatter(lx_final, outx_final, 15, 'filled','^')
        box on
    
        xlim ([start_x_H{a} 0.48])
        ylim ([lim_min_y lim_max_y])
        yticks([])
        xticks([])
               
        if a == 1
            title(AR{b})            
        elseif a == length(horizontal)
            xlabel('r/R')
            xticks(0.0:0.2:0.48)
        else
        end
        if b == 1
            ylabel(horizontal{a},'fontweight','bold')
            yticks(0.02:0.03:0.14)
            hold off
        else
            hold off
        end
    end
end
lh = legend({'impeller edge classic PIV','impeller edge tilted PIV','Stereo-PIV - k_{3C}','Classic PIV - k_{iso}','Tilted PIV - k_{2C}'}, 'FontSize', 12, 'Orientation', 'horizontal');
lh.Layout.Tile = 'south';
lh.NumColumns = 3;

Save(save_tif, save_svg, impeller, parameter,'')
