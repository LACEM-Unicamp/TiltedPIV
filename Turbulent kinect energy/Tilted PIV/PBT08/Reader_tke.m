%--------------------------------------------------------------------------
%This function reads rms of velocity fluctuations data from a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_tke(impeller,AR,tec,cam,pass,met)
mydir  = pwd;
global dxe dye R H U_tip

if strcmp(tec,'PIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
load rms_v.mat rms_v
    a=rms_v;
    load rms_u.mat rms_u x y
    b=rms_u;
    
    if strcmp(met,'iso')
        var = (0.75*(a + b))./U_tip^2;
    elseif strcmp(met,'2C')
        var = (0.5*(a + b))./U_tip^2;
    else
        error('invalid method')
    end
    
    var_x = x + dxe;
    var_x=var_x./R;
    
    var_y = y + dye;
    var_y=var_y./H;

elseif strcmp(tec,'SPIV')
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',AR,'\','PIV_pass',pass];
    cd (Dir)
    
    load rms_v.mat rms_v
    a = rms_v;
    load rms_u.mat rms_u
    b = rms_u;
    load rms_w.mat rms_w x y
    c = rms_w;
    
    var = (0.5*(a + b + c))./U_tip^2;
        
    var_x = x + dxe;
    var_x=var_x./R;
    
    var_y = y + dye;
    var_y=var_y./H;
    
else
    error('invalid technique')
end

cd (mydir)

end
