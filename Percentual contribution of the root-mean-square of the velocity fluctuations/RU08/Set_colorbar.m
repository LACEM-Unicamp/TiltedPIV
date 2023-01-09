function [] = Set_colorbar(cmin, cmax)

cb = colorbar;
cb.Layout.Tile = 'East';
cb.FontSize = 12;
ticksvalue = (cmax-cmin)/4;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.TickLabels = {'0%','25%','50%','75%','100%'};
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;
cb.Label.String = '$0.5*u''^2/k_{3C}$,\enspace $0.5*v''^2/k_{3C}$,\enspace $0.5*w''^2/k_{3C}$';

end