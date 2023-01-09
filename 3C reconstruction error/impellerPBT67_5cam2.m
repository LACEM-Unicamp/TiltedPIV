global R H

%Shaft
hold on
h=rectangle('Position',[0.057 0.305 8.0/R 32.0/H],'Curvature',0.1);
h.FaceColor=[0.75 0.75 0.75];
h.EdgeColor=[0.45 0.45 0.45];
hold off
    
%Impeller
hold on
h=rectangle('Position',[0.057 0.30 9.5/R 27.0/H],'Curvature',0.1);
h.FaceColor=[0.75 0.75 0.75];
h.EdgeColor=[0.45 0.45 0.45];
hold off

%Blade
hold on
pgon = polyshape([0.045 0.0997 0.3483 0.2581],...
    [0.2992 0.378 0.3558 0.2765]);
p=plot(pgon);
p.FaceColor=[0.75 0.75 0.75];
p.EdgeColor=[0.45 0.45 0.45];
p.HoleEdgeColor=[0.5 0.5 0.5];
p.FaceAlpha=1;
p.EdgeAlpha=1;
p.LineStyle='-';
hold off