%--------------------------------------------------------------------------
%This function computes the relaqtive percentage of the absolute difference
% between turbulent kinetic energy values from data selected in a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_difftke_classic_tilted(impeller,AR,cam,pass,met)
mydir  = pwd;
global dxe dye R H

tec = 'PIV';
cam = 'Cam 2';
Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
cd (Dir)

load rms_v.mat rms_v
a = rms_v;
load rms_u.mat rms_u x y
b = rms_u;

tke_cpiv =(0.75*(a + b));
    
var_x = x + dxe;
var_x=var_x./R;

var_y = y + dye;
var_y=var_y./H;

cam = 'Cam 1';
Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
cd (Dir)

load rms_v.mat rms_v
a = rms_v;
load rms_u.mat rms_u
b = rms_u;

if strcmp(met,'iso')
    tke_iso=(0.75*(a + b));
    var=100*abs(1 - tke_iso./tke_cpiv);
elseif strcmp(met,'2C')
    tke_2C=(0.5*(a + b));
    var=100*abs(1 - tke_2C./tke_cpiv);
else
    error('invalid method')
end

cd (mydir)

end