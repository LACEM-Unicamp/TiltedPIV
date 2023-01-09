%--------------------------------------------------------------------------
%This function reads rms of velocity fluctuations data from a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_velocity_components(impeller,AR,tec,cam,pass,component)
mydir  = pwd;
global dxe dye R H U_tip

if strcmp(tec,'PIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    if strcmp(component,'radial')
        load media_u.mat media x y
        var = media./(U_tip); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;
        
    elseif strcmp(component,'axial')
        load media_v.mat media x y
        var = media./(U_tip); 
        
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
        load media_u.mat media x y
        var = media./(U_tip); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;        
    elseif strcmp(component,'axial')
        load media_v.mat media x y
        var = media./(U_tip); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;        
    elseif strcmp(component,'tangential')
        load media_w.mat media x y
        var = media./(U_tip); 
        
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
