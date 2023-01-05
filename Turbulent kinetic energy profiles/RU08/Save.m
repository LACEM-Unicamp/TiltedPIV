function [] = Save(save_tif, save_svg)

if save_tif == 1
   fig = figure(1);
   print(fig,sprintf('figure_3'), '-painters', '-dtiff')
else
end

if save_svg == 1
    fig = figure(1);
    print(fig,sprintf('figure_3'), '-painters', '-dsvg')
end

end