function [] = Set_colorbar(cmin, cmax, component)

cb = colorbar;
ticksvalue = (cmax-cmin)/4;
cb.FontSize = 12;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.Layout.Tile = 'East';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;

if strcmp(component,'radial') == 1 
    cb.Label.String = '$ u/U_{tip}$';
elseif strcmp(component,'axial') == 1 
    cb.Label.String = '$v/U_{tip} $';
elseif strcmp(component,'tangential') == 1 
    cb.Label.String = '$w/U_{tip}$';
else
    cb.Label.String = '$u/U_{tip}$,\enspace $v/U_{tip}$,\enspace $w/U_{tip}$';
end

end