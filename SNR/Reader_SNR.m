%--------------------------------------------------------------------------
%This function reads SNR data from a specific folder with PIV measurements
%--------------------------------------------------------------------------
function [var_e,var_x,var_y] = Reader_SNR(impeller,AR,tec,cam,pass,met)
global dxe dye R H
mydir  = pwd;

if strcmp(tec,'PIV') == 1
    Dir = ['C:\Users\Usuario\Documents\Aline De Mitri\Dados\',impeller,'\',tec,'\',cam,'\',AR,'\','PIV_pass',pass];
    cd (Dir)

    if strcmp(met,'SNR') == 1
        load media_SNR.mat media x y
        var_e = media;
        var_x = (x + dxe)./R;
        var_y = (y + dye)./H;
    else
        error('non-existent methodology')
    end

elseif strcmp(tec,'SPIV') == 1
    error('non-existent parameter') 

else
    error('non-existent technique')
end

cd (mydir)

end
