%--------------------------------------------------------------------------
%This function reads rms of velocity fluctuations data from a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_uncertainty_rms(impeller,AR,tec,cam,pass,component)
mydir  = pwd;
global dxe dye R H U_tip

if strcmp(tec,'PIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados incerteza\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
        
    if strcmp(component,'radial')
       load TKE_2C.mat UQ_Ruu x y
        var = UQ_Ruu./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;
        
    elseif strcmp(component,'axial')
        load TKE_2C.mat UQ_Rvv x y
        var = UQ_Rvv./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;
    else
        error('invalid component')
    end
    
elseif strcmp(tec,'SPIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados incerteza\',impeller,'\',tec,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    if strcmp(component,'radial')
        load TKE_3C.mat UQ_Ruu x y
        var = UQ_Ruu./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;        
    elseif strcmp(component,'axial')
        load TKE_3C.mat UQ_Rvv x y
        var = UQ_Rvv./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;        
    elseif strcmp(component,'tangential')
        load TKE_3C.mat UQ_Rww x y
        var = UQ_Rww./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;    
    else
        error('invalid component')
    end 
else
    error('invalid technique')
end

cd (mydir)

end
