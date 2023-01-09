function [] = Set_colorbar(cmin, cmax, cblabel)

cb = colorbar;
ticksvalue = (cmax-cmin)/4;
cb.FontSize = 12;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.Layout.Tile = 'East';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;

if strcmp(cblabel,'error_3C') == 1
    cb.Label.String = '$Error_{3C}$ \enspace [px]';
else
end

end