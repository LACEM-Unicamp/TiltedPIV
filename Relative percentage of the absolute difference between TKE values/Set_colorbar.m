function [] = Set_colorbar(cmin, cmax, cblabel)

cb = colorbar;
ticksvalue = (cmax-cmin)/4;
cb.FontSize = 12;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.TickLabels = {'0%','25%','50%','75%','100%'};
cb.Layout.Tile = 'East';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;

if strcmp(cblabel,'iso') == 1
    cb.Label.String = '$|k_{3C}-k_{iso}|/k_{3C}$';
elseif strcmp(cblabel,'2C') == 1
    cb.Label.String = '$|k_{3C}-k_{2C}|/k_{3C}$';
else
    cb.Label.String = '$|k_{3C}-k|/k_{3C}$';
end

end




