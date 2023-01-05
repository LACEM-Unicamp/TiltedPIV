function [ly,outy]=lineV(inicioxV,inicioyV,x,y,var)
ix = x >= inicioxV;
[~,idx] = find(ix==1,1);
iy = y >= inicioyV;
[idy,~] = find(iy==1,1);
ly = y(idy:end,idx);
outy = var(idy:end,idx);
end
