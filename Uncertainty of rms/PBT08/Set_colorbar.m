function [] = Set_colorbar(cmin, cmax, component)

cb = colorbar;
ticksvalue = (cmax-cmin)/4;
cb.FontSize = 12;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.Layout.Tile = 'East';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;

if strcmp(component,'radial') == 1 
    cb.Label.String = '$UQ_{uu}/U_{tip}^2$';
elseif strcmp(component,'axial') == 1 
    cb.Label.String = '$UQ_{vv}/U_{tip}^2$';
elseif strcmp(component,'tangential') == 1 
    cb.Label.String = '$UQ_{ww}/U_{tip}^2$';
else
    cb.Label.String = '$UQ_{uu}/U_{tip}^2$,\enspace $UQ_{vv}/U_{tip}^2$,\enspace $UQ_{ww}/U_{tip}^2$';
end

end