function plotinHasil (datas)
a = datas;
b = (datas(:,1:2));
for i=1:size(a,1)
    if a(i,3) == 1
        scatter(b(i,1), b(i,2), 'o', '.r');
        hold on;
    elseif a(i,3) == 2
        scatter(b(i,1), b(i,2), 'o', '.g');
        hold on;
    elseif a(i,3) == 3
        scatter(b(i,1), b(i,2), 'o','.b');
        hold on;
    end
end