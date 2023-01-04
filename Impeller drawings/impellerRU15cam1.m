global R H

%Shaft
hold on
h=rectangle('Position',[0.057 0.30 8.0/R 47.0/H],'Curvature',0.1);
h.FaceColor=[0.75 0.75 0.75];
h.EdgeColor=[0.45 0.45 0.45];
hold off

%Impeller
hold on
h=rectangle('Position',[0.057 0.30 9.0/R 20.0/H],'Curvature',0.1);
h.FaceColor=[0.75 0.75 0.75];
h.EdgeColor=[0.45 0.45 0.45];
hold off

%Disc
hold on
pgon = polyshape([0.055 0.055 0.2598 0.2598], [0.3017 0.3429 0.3429 0.3293]);
p=plot(pgon);
p.FaceColor=[0.70 0.70 0.70];
p.EdgeColor=[0.45 0.45 0.45];
p.HoleEdgeColor=[0.5 0.5 0.5];
p.FaceAlpha=1;
p.EdgeAlpha = 1;
p.LineStyle='-';
hold off



