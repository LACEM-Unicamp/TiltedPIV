
function [] = impeller_limits(i,angle,start_x_H, lim_min_y, lim_max_y)

limx_AR0_cam1 = {0.042, 0.3874, 0.3874, 0.0};
limx_AR15_cam1 = {0.042, 0.2598, 0.0, 0.0};
limx_AR30_cam1 = {0.042, 0.2636, 0.0, 0.0};
limx_AR45_cam1 = {0.042, 0.2636, 0.2152, 0.0};

limx_AR0_cam2 = {0.042, 0.4, 0.4, 0.0};
limx_AR15_cam2 = {0.042, 0.2527, 0.1216, 0.1216};
limx_AR30_cam2 = {0.042, 0.2527, 0.2281, 0.0};
limx_AR45_cam2 = {0.042, 0.3155, 0.3155, 0.0};

cam = 'cam1';
lim_max_x = sprintf('limx_AR%s_%s', angle, cam);
h=rectangle('Position',[start_x_H lim_min_y lim_max_x{i} lim_max_y]);
h.FaceColor=[0.5 0.5 0.5];
h.EdgeColor=[0.45 0.45 0.45];

cam = 'cam2';
lim_max_x = sprintf('limx_AR%s_%s', angle, cam);
h=rectangle('Position',[start_x_H lim_min_y lim_max_x{i} lim_max_y]);
h.FaceColor=[0.75 0.75 0.75];
h.EdgeColor=[0.45 0.45 0.45];

end

eval(['NAME_' num2str(i) '=dataset;']);