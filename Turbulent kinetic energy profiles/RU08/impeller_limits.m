
function [] = impeller_limits(i,angle)

limx_AR0_cam1 = {0.099, 0.3874, 0.3874, 0.0};
limx_AR15_cam1 = {0.099, 0.2598, 0.0, 0.0};
limx_AR30_cam1 = {0.099, 0.2636, 0.0, 0.0};
limx_AR45_cam1 = {0.099, 0.2636, 0.2152, 0.0};

limx_AR0_cam2 = {0.099, 0.4, 0.4, 0.0};
limx_AR15_cam2 = {0.099, 0.2527, 0.1216, 0.1216};
limx_AR30_cam2 = {0.099, 0.2527, 0.2281, 0.0};
limx_AR45_cam2 = {0.099, 0.3155, 0.3155, 0.0};

if strcmp(angle,'0')
    lim_max_x_cam1 = limx_AR0_cam1{i};
    lim_max_x_cam2 = limx_AR0_cam2{i};
elseif strcmp(angle,'15')
    lim_max_x_cam1 = limx_AR15_cam1{i};
    lim_max_x_cam2 = limx_AR15_cam2{i};
elseif strcmp(angle,'30')
    lim_max_x_cam1 = limx_AR30_cam1{i};
    lim_max_x_cam2 = limx_AR30_cam2{i}; 
elseif strcmp(angle,'45')
    lim_max_x_cam1 = limx_AR45_cam1{i};
    lim_max_x_cam2 = limx_AR45_cam2{i};
else
    error('invalid angle')
end

xline(lim_max_x_cam2,':m', 'LineWidth', 1.25);
xline(lim_max_x_cam1, '--m', 'LineWidth', 1.0);

end
