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
pgon = polyshape([0.0587 0.0614 0.0888 0.1596],...
    [0.3075 0.3121 0.3410 0.3225]);
p=plot(pgon);
p.FaceColor=[0.5 0.5 0.5];
p.EdgeColor=[0.45 0.45 0.45];
p.HoleEdgeColor=[0.5 0.5 0.5];
p.FaceAlpha=1;
p.EdgeAlpha=1;
p.LineStyle='-';
hold off
