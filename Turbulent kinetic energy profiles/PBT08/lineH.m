function [lx,outx]=lineH(inicioxH,inicioyH,x,y,var)
ix = x >= inicioxH;
[~,idx] = find(ix==1,1);
lx = x(1,idx:end);
iy = y <= inicioyH;
[idy,~] = find(iy==1,1);
outx = var(idy,idx:end);
end
