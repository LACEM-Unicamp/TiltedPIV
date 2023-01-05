global R H

%Shaft
hold on
h=rectangle('Position',[0.057 0.30 8.0/R 36.0/H],'Curvature',0.1);
h.FaceColor=[0.5 0.5 0.5];
h.EdgeColor=[0.45 0.45 0.45];
hold off
    
%Impeller
hold on
h=rectangle('Position',[0.057 0.30 9.5/R 27.0/H],'Curvature',0.1);
h.FaceColor=[0.5 0.5 0.5];
h.EdgeColor=[0.45 0.45 0.45];
hold off

%Blade
hold on
pgon = polyshape([0.0587 0.0942 0.4084 0.3756],...
    [0.3075 0.3553 0.3503 0.3025]);
p=plot(pgon);
p.FaceColor=[0.5 0.5 0.5];
p.EdgeColor=[0.45 0.45 0.45];
p.HoleEdgeColor=[0.5 0.5 0.5];
p.FaceAlpha=1;
p.EdgeAlpha=1;
p.LineStyle='-';
hold off