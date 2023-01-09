function [] = Set_colorbar(cmin, cmax, cblabel)

cb = colorbar;
ticksvalue = (cmax-cmin)/4;
cb.FontSize = 12;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.Layout.Tile = 'East';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;
cb.Label.String = 'SNR';

end




