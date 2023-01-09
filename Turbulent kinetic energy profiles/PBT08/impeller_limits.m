
function [] = impeller_limits(i,angle)

limx_AR0_cam1 = {0.099, 0.4, 0.0, 0.0};
limx_AR22_5_cam1 = {0.099, 0.107, 0.0, 0.0};
limx_AR45_cam1 = {0.099, 0.107, 0.0, 0.0};
limx_AR67_5_cam1 = {0.18, 0.26, 0.15, 0.0};

limx_AR0_cam2 = {0.099, 0.4, 0.0, 0.0};
limx_AR22_5_cam2 = {0.099, 0.107, 0.0, 0.0};
limx_AR45_cam2 = {0.099, 0.18, 0.15, 0.0};
limx_AR67_5_cam2 = {0.099, 0.33, 0.26, 0.0};

if strcmp(angle,'0')
    lim_max_x_cam1 = limx_AR0_cam1{i};
    lim_max_x_cam2 = limx_AR0_cam2{i};
elseif strcmp(angle,'22_5')
    lim_max_x_cam1 = limx_AR22_5_cam1{i};
    lim_max_x_cam2 = limx_AR22_5_cam2{i};
elseif strcmp(angle,'45')
    lim_max_x_cam1 = limx_AR45_cam1{i};
    lim_max_x_cam2 = limx_AR45_cam2{i}; 
elseif strcmp(angle,'67_5')
    lim_max_x_cam1 = limx_AR67_5_cam1{i};
    lim_max_x_cam2 = limx_AR67_5_cam2{i};
else
    error('invalid angle')
end

xline(lim_max_x_cam2,':m','LineWidth',1.25);
xline(lim_max_x_cam1, '--m','LineWidth',1.0);


end
