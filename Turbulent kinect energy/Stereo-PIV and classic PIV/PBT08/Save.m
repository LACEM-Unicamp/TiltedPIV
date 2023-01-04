function [] = Save(save_tif, save_svg, impeller, parameter,component)

if save_tif == 1
   fig = figure(1);
   print(fig,sprintf('%s_%s_%s', impeller, parameter, component),'-painters', '-dtiff')
else
end

if save_svg == 1
    fig = figure(1);
    print(fig,sprintf('%s_%s_%s', impeller, parameter, component),'-painters', '-dsvg')
end

end