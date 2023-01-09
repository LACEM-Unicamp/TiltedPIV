global R H

%Shaft
hold on
h=rectangle('Position',[0.057 0.30 8.0/R 47.0/H],'Curvature',0.1);
h.FaceColor=[0.5 0.5 0.5];
h.EdgeColor=[0.45 0.45 0.45];
hold off

%Impeller
hold on
h=rectangle('Position',[0.057 0.30 9.0/R 20.0/H],'Curvature',0.1);
h.FaceColor=[0.5 0.5 0.5];
h.EdgeColor=[0.45 0.45 0.45];
hold off

%Blade
hold on
pgon = polyshape([0.1834 0.1834 0.3874 0.3874], [0.2927 0.3765 0.3765 0.2927]);
p=plot(pgon);
p.FaceColor=[0.5 0.5 0.5];
p.EdgeColor=[0.45 0.45 0.45];
p.HoleEdgeColor=[0.5 0.5 0.5];
p.FaceAlpha=1;
p.EdgeAlpha = 1;
p.LineStyle='-';
hold off

%Disc
hold on
pgon = polyshape([0.057 0.057 0.2527 0.2527], [0.2883 0.3429 0.3429 0.3293]);
p=plot(pgon);
p.FaceColor=[0.5 0.5 0.5];
p.EdgeColor=[0.45 0.45 0.45];
p.HoleEdgeColor=[0.5 0.5 0.5];
p.FaceAlpha=1;
p.EdgeAlpha = 1;
p.LineStyle='-';
hold off
