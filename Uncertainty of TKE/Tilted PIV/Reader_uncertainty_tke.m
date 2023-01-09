%--------------------------------------------------------------------------
%This function reads uncertanty quantities of turbulent kinetic energy from a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_uncertainty_tke(impeller,AR,tec,cam,pass,met)
mydir  = pwd;
global dxe dye R H U_tip

if strcmp(tec,'PIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados incerteza\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    if strcmp(met,'iso')
        load TKE_2C.mat UQ_TKE_2C_ISO x y
        var = UQ_TKE_2C_ISO./(U_tip^2); 
        
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;  

    elseif strcmp(met,'2C')
        load TKE_2C.mat UQ_TKE_2C x y
        var = UQ_TKE_2C./(U_tip^2); 
                
        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;

    else
        error('invalid TKE method')
    end
    
elseif strcmp(tec,'SPIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados incerteza\',impeller,'\',tec,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    if strcmp(met,'3C')
        load TKE_3C.mat UQ_TKE_3C x y
        var = UQ_TKE_3C./(U_tip^2); 

        var_x = x + dxe;
        var_x=var_x./R;

        var_y = y + dye;
        var_y=var_y./H;    
    else
        error('invalid TKE method')
    end
    
else
    error('invalid technique')
end

cd (mydir)

end
