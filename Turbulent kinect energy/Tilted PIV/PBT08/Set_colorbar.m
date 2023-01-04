function [] = Set_colorbar(cmin, cmax, met)

cb = colorbar;
ticksvalue = (cmax-cmin)/4;
cb.FontSize = 12;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.Layout.Tile = 'East';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;

if strcmp(met,'3C') == 1 
    cb.Label.String = '$ k_{3C}/U_{tip}^2$ ';
elseif strcmp(met,'iso') == 1 
    cb.Label.String = '$ k_{iso}/U_{tip}^2$';
elseif strcmp(met,'2C') == 1 
    cb.Label.String = '$ k_{2C}/U_{tip}^2$ ';
else
    cb.Label.String = '$ k/U_{tip}^2$ ';
end

end