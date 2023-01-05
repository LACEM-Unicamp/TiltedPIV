%Comparison among velocity gradients profiles
%--------------------------------------------------------------------------
%Saving status
%--------------------------------------------------------------------------
save_tif = 0; % in .tif
save_svg = 0; % in .svg
%--------------------------------------------------------------------------
%Font style
%--------------------------------------------------------------------------
EstiloFonte2
%--------------------------------------------------------------------------
%Global configurations
%--------------------------------------------------------------------------
global dxe dye R H U_tip

dxe = 46.05;  
dye = 136;

H = 380;       % tank height (mm)
R = 190;       % tank radius (mm)

RPM = 240;     % rotation speed (rpm)
N = RPM/60;    % rotation speed (rps)
D = 152*10^-3; % impeller diameter (m)
%--------------------------------------------------------------------------
%Tip velocity
U_tip = pi*D*N;     % m/s
%--------------------------------------------------------------------------
%Figure definitions
%--------------------------------------------------------------------------
pass = '4'; % processing pass
angle = {'0', '15', '30', '45'};
AR = {'AR 0º', 'AR 15º', 'AR 30º', 'AR 45º'};
met_PIV = {'iso',  '2C'};
met_SPIV = {'3C'}; 
tec = {'PIV', 'SPIV'};
cam = {'Cam 1', 'Cam 2'};
horizontal = {'z/H = 0.38', 'z/H = 0.33', 'z/H = 0.30', 'z/H = 0.24'}; %position of the profiles in the horizontal direction
start_x_H = {0.057, 0.057, 0.057, 0.057};
start_y_H = {0.38, 0.33, 0.30, 0.24};
lim_min_y = 0.02;
lim_max_y = 0.2;


figure(1);
set(figure(1),'Position',[50 50 800 800]);
layout = tiledlayout(4, 4);
tilespacing = 'tight';
        
for a = 1:length(horizontal)
    for b = 1:length(angle)
        nexttile
        
        hold on
        impeller_limits(a,angle{b},start_x_H, lim_min_y, lim_max_y)

        hold on       
        tec = 'SPIV';
        cam = '';
        met_PIV = '3C';
        [var, var_x, var_y] = Reader_method('RUSHTON08', angle{b}, tec, cam, pass, met_PIV);
        [lx, outx]=lineH(start_x_H{a}, start_y_H{a}, var_x, var_y, var);
        [lx_final, outx_final] = Cleaning (lx, outx);
        scatter(lx_final, outx_final, 15, 'filled')
       
        tec = 'PIV';
        cam = 'Cam 2';
        met_PIV = 'iso';
        [var, var_x, var_y] = Reader_method('RUSHTON08', angle{b}, tec, cam, pass, met_PIV);
        [lx, outx]=lineH(start_x_H{a}, start_y_H{a}, var_x, var_y, var);
        [lx_final, outx_final] = Cleaning (lx, outx);
        scatter(lx_final, outx_final, 15, 'filled','square')        
       
        tec = 'PIV';
        cam = 'Cam 1';
        met_PIV = '2C';
        [var, var_x, var_y] = Reader_method('RUSHTON08', angle{b}, tec, cam, pass, met_PIV);
        [lx, outx]=lineH(start_x_H{a}, start_y_H{a}, var_x, var_y, var);
        [lx_final, outx_final] = Cleaning (lx, outx);
        scatter(lx_final, outx_final, 15, 'filled','^')
        box on
    
        xlim ([start_x_H{a} 0.5])
        ylim ([lim_min_y lim_max_y])
               
        if a == 1
            title(AR{b})            
        elseif a == length(horizontal)
            xlabel('r/R')            
        else
        end
        
        if b == 1
            ylabel(horizontal{a}, 'FontSize', 12)
            hold off
        else
            hold off
        end
    end
end
lh = legend({'Stereo-PIV - k_{3C}','Classic PIV - k_{iso}','Tilted PIV - k_{2C}'}, 'FontSize', 12, 'Orientation', 'horizontal');
lh.Layout.Tile = 'south';

Save(save_tif, save_svg)
