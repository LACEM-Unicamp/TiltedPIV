function [] = Save(save_tif, save_svg,impeller)

if save_tif == 1
   fig = figure(1);
   print(fig,sprintf('figure_%s',impeller), '-painters', '-dtiff')
else
end

if save_svg == 1
    fig = figure(1);
    print(fig,sprintf('figure_%s',impeller), '-painters', '-dsvg')
end

end