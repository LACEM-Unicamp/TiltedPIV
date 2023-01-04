function [] = draw_impeller(impeller, angle, cam)

if strcmp(cam,'Cam 1') == 1
    cam = 'cam1';
elseif strcmp(cam,'Cam 2') == 1
    cam = 'cam2';
else
    error ('invalid camera')
end

if strcmp(impeller,'RUSHTON08') == 1
    impeller = 'RU';
elseif strcmp(impeller,'PBT4508') == 1
    impeller = 'PBT';
else
    error('invalid impeller')
end

run (sprintf('impeller%s%s%s.m',impeller,angle,cam))

end
