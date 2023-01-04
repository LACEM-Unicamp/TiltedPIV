%--------------------------------------------------------------------------
%This function reads rms of velocity fluctuations data from a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_rms(impeller,AR,tec,cam,pass,component)
mydir  = pwd;
global dxe dye R H U_tip

if strcmp(tec,'PIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    if strcmp(component,'radial')
        load rms_u.mat rms_u x y
        var = rms_u./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;
        
    elseif strcmp(component,'axial')
        load rms_v.mat rms_v x y
        var = rms_v./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;
    else
        error('invalid component')
    end
    
elseif strcmp(tec,'SPIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    if strcmp(component,'radial')
        load rms_u.mat rms_u x y
        var = rms_u./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;        
    elseif strcmp(component,'axial')
        load rms_v.mat rms_v x y
        var = rms_v./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;        
    elseif strcmp(component,'tangential')
        load rms_w.mat rms_w x y
        var = rms_w./(U_tip^2); 
        
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
