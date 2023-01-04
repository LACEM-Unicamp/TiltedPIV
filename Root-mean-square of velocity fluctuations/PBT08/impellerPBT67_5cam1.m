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
pgon = polyshape([0.007 0.007 0.1533 0.2606],...
    [0.2387 0.3400 0.3850 0.3462]);
p=plot(pgon);
p.FaceColor=[0.75 0.75 0.75];
p.EdgeColor=[0.45 0.45 0.45];
p.HoleEdgeColor=[0.5 0.5 0.5];
p.FaceAlpha=1;
p.EdgeAlpha=1;
p.LineStyle='-';
hold off 