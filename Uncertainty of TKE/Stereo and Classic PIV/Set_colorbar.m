function [] = Set_colorbar(cmin, cmax, cblabel)

cb = colorbar;
ticksvalue = (cmax-cmin)/4;
cb.FontSize = 12;
cb.Ticks = (cmin:ticksvalue:cmax);
cb.Layout.Tile = 'East';
cb.Label.Interpreter = 'latex';
cb.Label.FontSize = 14;

if strcmp(cblabel,'iso') == 1
    cb.Label.String = '$UQ_{k_{iso}}/U_{tip}^2$';
elseif strcmp(cblabel,'2C') == 1
    cb.Label.String = '$UQ_{k_{2C}}/U_{tip}^2$';
    cb.Ruler.Exponent = -2;
elseif strcmp(cblabel,'3C') == 1
    cb.Label.String = '$UQ_{k_{3C}}/U_{tip}^2$';
else
    cb.Label.String = '$UQ_{k}/U_{tip}^2$';
    cb.Ruler.Exponent = -2;
end

end