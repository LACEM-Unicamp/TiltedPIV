%--------------------------------------------------------------------------
%This function reads rms of velocity fluctuations data from a folder
%--------------------------------------------------------------------------
function [var,var_x,var_y] = Reader_contribution_rms(impeller,AR,tec,pass,component)
mydir  = pwd;
global dxe dye R H
 
Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',AR,'\','PIV_pass',pass];
cd (Dir)

load rms_u.mat rms_u
a = rms_u;
load rms_v.mat rms_v
b = rms_v;
load rms_w.mat rms_w x y
c = rms_w;
    
tke = 0.5*(a + b + c);

var_x = (x + dxe)./R;

var_y = (y + dye)./H;

if strcmp(component,'radial')
    var = 100*(0.5*a./tke); 
elseif strcmp(component,'axial')
    var = 100*(0.5*b./tke);     
elseif strcmp(component,'tangential')
    var = 100*(0.5*c./tke); 
else
    error('invalid component')
end 

cd (mydir)

end
