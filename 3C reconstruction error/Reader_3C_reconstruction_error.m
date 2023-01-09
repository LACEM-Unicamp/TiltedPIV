%--------------------------------------------------------------------------
%This function reads uncertanty quantities of turbulent kinetic energy from a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_3C_reconstruction_error (impeller,AR,tec,cam,pass,met)
mydir  = pwd;
global dxe dye R H

if strcmp(tec,'PIV')
    error ('invalid technique')
    
elseif strcmp(tec,'SPIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    if strcmp(met,'error_3C')
        load media_error_3C.mat media_error_3C x y
        var = media_error_3C; 

        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;    
    else
        error('invalid parameter')
    end
    
else
    error('invalid input')
end

cd (mydir)

end
