function [ly_final, outy_final] = Cleaning (ly, outy)

union = [reshape(ly,1,[])',reshape(outy,1,[])'];
size = round(length(union)/25);
if size == 0
    sz = 1;
else
    sz = size;
end
union_clean = union(1:sz:end,:);
ly_final = union_clean(:,1);
outy_final = union_clean(:,2);

end

