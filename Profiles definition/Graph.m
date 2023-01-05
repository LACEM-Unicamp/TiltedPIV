function [] = Graph(x,y,var,showtt,tt,xlb,ylb,cmax,cmin)
global lim_min_x lim_max_x lim_min_y lim_max_y 

h(1) = pcolor(x,y,var);
set(h(1), 'EdgeColor', 'none');
colormap 'jet'
shading interp;

if showtt == 1
    if strcmp(tt,'AR 0') == 1 
        title ('AR 0º','FontWeight','bold');
    elseif strcmp(tt,'AR 15') == 1 
        title ('AR 15º','FontWeight','bold');
    elseif strcmp(tt,'AR 30') == 1 
        title ('AR 30º','FontWeight','bold');
    elseif strcmp(tt,'AR 45') == 1
        title ('AR 45º','FontWeight','bold');
    else
        error('angulo invalido')
    end
end

caxis([cmin cmax]) 

ylim([lim_min_y lim_max_y])
xlim([lim_min_x lim_max_x])

if ylb == 1
ylabel('z/H');
end

if xlb == 1
xlabel('r/R');
end

end