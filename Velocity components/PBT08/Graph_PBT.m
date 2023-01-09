function [] = Graph_PBT(x, y, var, xlb, ylb, cmax, cmin, showtt, angle, ...
    showimpeller, tec, cam)

global lim_min_x lim_max_x lim_min_y lim_max_y 

h(1) = pcolor(x,y,var);
set(h(1), 'EdgeColor', 'none')
colormap 'jet'
shading interp
caxis([cmin cmax])
box off

if showtt == 1
    if strcmp(angle,'0') == 1 
        title('AR 0º','FontWeight','bold')
    elseif strcmp(angle,'22_5') == 1 
        title('AR 22.5º','FontWeight','bold')
    elseif strcmp(angle,'45') == 1 
        title('AR 45º','FontWeight','bold')
    elseif strcmp(angle,'67_5') == 1
        title('AR 67.5º','FontWeight','bold')
    else
        error('invalid angle-resolved')
    end
end

ylim([lim_min_y lim_max_y])
xlim([lim_min_x lim_max_x])

if ylb == 1
ylabel('z/H')
else
end

if xlb == 1
xlabel('r/R')
else
end

if strcmp(cam,'Cam 1') == 1
    cam = 'cam1';
elseif strcmp(cam,'Cam 2') == 1
    cam = 'cam2';
else
end

if showimpeller == 1
    if strcmp(tec,'SPIV') == 1
        run (sprintf('impellerPBT%scam1spiv.m', angle))
        run (sprintf('impellerPBT%scam2.m', angle))       
    elseif strcmp(tec,'PIV') == 1
        run (sprintf('impellerPBT%s%s.m', angle, cam))        
    else
        error('invalid tecnique')
    end
else
end

end