%--------------------------------------------------------------------------
%This function computes the relaqtive percentage of the absolute difference
% between turbulent kinetic energy values from data selected in a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_difftke_stereo_piv(impeller,AR,cam,pass,met)
mydir  = pwd;
global dxe dye R H

tec = 'SPIV';
Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',AR,'\','PIV_pass',pass];
cd (Dir)

load rms_v.mat rms_v
a = rms_v;
load rms_u.mat rms_u
b = rms_u;
load rms_w.mat rms_w x y
c = rms_w;

tke_3C=(0.5*(a + b + c));
    
var_x = x + dxe;
var_x=var_x./R;

var_y = y + dye;
var_y=var_y./H;

tec = 'PIV';
Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
cd (Dir)

load rms_v.mat rms_v
a = rms_v;
load rms_u.mat rms_u
b = rms_u;

if strcmp(met,'iso')
    tke_iso=(0.75*(a + b));
    var=100*abs(1 - tke_iso./tke_3C);
elseif strcmp(met,'2C')
    tke_2C=(0.5*(a + b));
    var=100*abs(1 - tke_2C./tke_3C);
else
    error('invalid method')
end

cd (mydir)

end
